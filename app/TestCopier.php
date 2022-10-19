<?php

declare(strict_types=1);

namespace App;

use App\Services\DB;
use DigitalStars\DataBase\DB as Database;
use DOMDocument;

class TestCopier
{
    private string $testId;
    private Database $db;

    public function __invoke(int $id, string $newName): string
    {
        $this->db = DB::getConnection();

        $baseTest = $this->db->query("SELECT * from tests WHERE tests.id = ?i;", [$id])->fetch();

        if (!$baseTest) {
            return $this->onFailure("Test id: $id is not found!");
        }

        $this->db->exec(
            "INSERT INTO tests"
            . " (course_id, folder_id, name, order_is_important, is_delete, score_passing,"
            . " max_bal, is_public, order_answers_is_important)"
            . " VALUE (?i, ?i, ?s, ?i, ?i, ?i, ?i, ?i, ?i);",
            [
                $baseTest['course_id'],
                $baseTest['folder_id'],
                $newName,
                $baseTest['order_is_important'],
                $baseTest['is_delete'],
                $baseTest['score_passing'],
                $baseTest['max_bal'],
                $baseTest['is_public'],
                $baseTest['order_answers_is_important'],
            ]
        );

        $this->testId = $this->db->lastInsertId();

        $questionTables = $this->getCallbacks();

        foreach ($questionTables as $questionTable => $callback) {
            $questions = $this->getQuestions($questionTable, $id);
            call_user_func($callback, $questions);
        }

        return json_encode(['id' => $this->testId]);
    }

    private function copyAgreementQuestions(array $questions): void
    {
        foreach ($questions as $question) {
            $this->db->exec(
                "INSERT INTO tests_p_agreement"
                . " (test_id, title, text, comment, number, max_bal, is_comment, is_show_correct_answer)"
                . " SELECT ?i, title, text, comment, number, max_bal, is_comment, is_show_correct_answer"
                . " FROM tests_p_agreement WHERE id = ?i;",
                [
                    $this->testId,
                    $question['id'],
                ]
            );

            $newQuestionId = $this->db->lastInsertId();

            $this->db->exec(
                "INSERT INTO tests_p_agreement_extend"
                . " (tests_p_agreement_id, file_id, file_name)"
                . " SELECT ?i, file_id, file_name FROM tests_p_agreement_extend"
                . " WHERE tests_p_agreement_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );

            $queries = $this->db->query(
                "SELECT id, tests_p_agreement_id, number, text, is_delete FROM tests_p_agreement_query"
                . " WHERE tests_p_agreement_id = ?i;",
                [
                    $question['id'],
                ]
            )->fetchAll();

            $queryIds = [];
            foreach ($queries as $query) {
                $this->db->exec(
                    "INSERT INTO tests_p_agreement_query"
                    . " (tests_p_agreement_id, number, text)"
                    . " VALUE (?i, ?i, ?s);",
                    [
                        $newQuestionId,
                        $query['number'],
                        $query['text'],
                    ]
                );

                $queryIds[$query['id']] = $this->db->lastInsertId();
            }

            $answers = $this->db->query(
                "SELECT id, tests_p_agreement_id, tests_p_agreement_query_id, text"
                . " FROM tests_p_agreement_answer"
                . " WHERE tests_p_agreement_id = ?i;",
                [
                    $question['id']
                ]
            )->fetchAll();

            foreach ($answers as $answer) {
                $this->db->exec(
                    "INSERT INTO tests_p_agreement_answer"
                    . " (tests_p_agreement_id, tests_p_agreement_query_id, text)"
                    . " VALUE (?i, ?i, ?s);",
                    [
                        $newQuestionId,
                        $queryIds[$answer['tests_p_agreement_query_id']] ?? null,
                        $answer['text'],
                    ]
                );
            }
        }
    }

    private function copyGapQuestions(array $questions): void
    {
        foreach ($questions as $question) {
            $questionText = $this->dropInputValues($question['text']);

            $this->db->exec(
                "INSERT INTO tests_p_gap"
                . " (test_id, title, text, comment, number, max_bal, is_comment, is_show_correct_answer)"
                . " SELECT ?i, title, ?s, comment, number, max_bal, is_comment, is_show_correct_answer FROM tests_p_gap"
                . " WHERE id = ?i;",
                [
                    $this->testId,
                    $questionText,
                    $question['id'],
                ]
            );

            $newQuestionId = $this->db->lastInsertId();

            $this->db->exec(
                "INSERT INTO tests_p_gap_extend"
                . " (tests_p_gap_id, file_id, file_name)"
                . " SELECT ?i, file_id, file_name FROM tests_p_gap_extend"
                . " WHERE tests_p_gap_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );

            $inputs = $this->db->query(
                "SELECT * FROM tests_p_gap_input WHERE tests_p_gap_id = ?i;",
                [
                    $question['id'],
                ]
            )->fetchAll();

            foreach ($inputs as $input) {
                $this->db->exec(
                    "INSERT INTO tests_p_gap_input"
                    . " (tests_p_gap_id)"
                    . " VALUE (?i);",
                    [
                        $newQuestionId,
                    ]
                );

                $newInputId = $this->db->lastInsertId();

                $this->db->exec(
                    "INSERT INTO tests_p_gap_input_answer"
                    . " (tests_p_gap_input_id, answer)"
                    . " SELECT ?i, answer FROM tests_p_gap_input_answer"
                    . " WHERE tests_p_gap_input_id = ?i;",
                    [
                        $newInputId,
                        $input['id'],
                    ]
                );
            }
        }
    }

    private function copyGapSelectQuestions(array $questions): void
    {
        foreach ($questions as $question) {
            $questionText = $this->dropInputValues($question['text']);

            $this->db->exec(
                "INSERT INTO tests_p_gap_select"
                . " (test_id, title, text, comment, number, max_bal,"
                . " is_comment, is_show_correct_answer, is_multiselect)"
                . " SELECT ?i, title, ?s, comment, number, max_bal,"
                . " is_comment, is_show_correct_answer, is_multiselect"
                . " FROM tests_p_gap_select"
                . " WHERE id = ?i;",
                [
                    $this->testId,
                    $questionText,
                    $question['id'],
                ]
            );

            $newQuestionId = $this->db->lastInsertId();

            $this->db->exec(
                "INSERT INTO tests_p_gap_select_extend"
                . " (tests_p_gap_select_id, file_id, file_name)"
                . " SELECT ?i, file_id, file_name FROM tests_p_gap_select_extend"
                . " WHERE tests_p_gap_select_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );

            $inputs = $this->db->query(
                "SELECT * FROM tests_p_gap_select_input WHERE tests_p_gap_select_id = ?i;",
                [
                    $question['id'],
                ]
            )->fetchAll();

            foreach ($inputs as $input) {
                $this->db->exec(
                    "INSERT INTO tests_p_gap_select_input"
                    . " (tests_p_gap_select_id)"
                    . " VALUE (?i);",
                    [
                        $newQuestionId,
                    ]
                );

                $newInputId = $this->db->lastInsertId();

                $this->db->exec(
                    "INSERT INTO tests_p_gap_select_input_answer"
                    . " (tests_p_gap_select_input_id, answer, correct)"
                    . " SELECT ?i, answer, correct FROM tests_p_gap_select_input_answer"
                    . " WHERE tests_p_gap_select_input_id = ?i;",
                    [
                        $newInputId,
                        $input['id'],
                    ]
                );
            }
        }
    }

    private function copySequenceQuestions(array $questions): void
    {
        foreach ($questions as $question) {
            $this->db->exec(
                "INSERT INTO tests_p_sequence"
                . " (test_id, title, text, comment, number, max_bal, is_comment, is_show_correct_answer)"
                . " SELECT ?i, title, text, comment, number, max_bal, is_comment, is_show_correct_answer"
                . " FROM tests_p_sequence WHERE id = ?i;",
                [
                    $this->testId,
                    $question['id'],
                ]
            );

            $newQuestionId = $this->db->lastInsertId();

            $this->db->exec(
                "INSERT INTO tests_p_sequence_extend"
                . " (tests_p_sequence_id, file_id, file_name)"
                . " SELECT ?i, file_id, file_name FROM tests_p_sequence_extend"
                . " WHERE tests_p_sequence_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );

            $this->db->exec(
                "INSERT INTO tests_p_sequence_query"
                . " (tests_p_sequence_id, number, answer)"
                . " SELECT ?i, number, answer FROM tests_p_sequence_query"
                . " WHERE tests_p_sequence_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );
        }
    }

    private function copyTestQuestions(array $questions): void
    {
        foreach ($questions as $question) {
            $this->db->exec(
                "INSERT INTO tests_p_test"
                . " (test_id, title, text, comment, number, max_bal,"
                . " is_comment, is_show_correct_answer, is_multi_response)"
                . " SELECT ?i, title, text, comment, number, max_bal,"
                . " is_comment, is_show_correct_answer, is_multi_response"
                . " FROM tests_p_test WHERE id = ?i;",
                [
                    $this->testId,
                    $question['id'],
                ]
            );

            $newQuestionId = $this->db->lastInsertId();

            $this->db->exec(
                "INSERT INTO tests_p_test_extend"
                . " (tests_p_test_id, file_id, file_name)"
                . " SELECT ?i, file_id, file_name FROM tests_p_test_extend"
                . " WHERE tests_p_test_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );

            $this->db->exec(
                "INSERT INTO tests_p_test_query"
                . " (tests_p_test_id, number, answer, correct)"
                . " SELECT ?i, number, answer, correct FROM tests_p_test_query"
                . " WHERE tests_p_test_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );
        }
    }

    private function copyTextQuestions(array $questions): void
    {
        foreach ($questions as $question) {
            $this->db->exec(
                "INSERT INTO tests_p_text"
                . " (test_id, title, text, comment, number, max_bal,"
                . " is_comment, is_show_correct_answer, is_multiline, check_type)"
                . " SELECT ?i, title, text, comment, number, max_bal,"
                . " is_comment, is_show_correct_answer, is_multiline, check_type"
                . " FROM tests_p_text WHERE id = ?i;",
                [
                    $this->testId,
                    $question['id'],
                ]
            );

            $newQuestionId = $this->db->lastInsertId();

            $this->db->exec(
                "INSERT INTO tests_p_text_extend"
                . " (tests_p_text_id, file_id, file_name)"
                . " SELECT ?i, file_id, file_name FROM tests_p_text_extend"
                . " WHERE tests_p_text_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );

            $this->db->exec(
                "INSERT INTO tests_p_text_answer"
                . " (tests_p_text_id, answer, correct)"
                . " SELECT ?i, answer, correct FROM tests_p_text_answer"
                . " WHERE tests_p_text_id = ?i;",
                [
                    $newQuestionId,
                    $question['id'],
                ]
            );
        }
    }

    private function getQuestions(string $table, int $id): array
    {
        return $this->db
            ->query(
                "SELECT * FROM " . $table
                . " WHERE test_id = ?i AND is_delete = 0;",
                [$id]
            )->fetchAll();
    }

    private function onFailure(string $message): string
    {
        return json_encode(['message' => $message]);
    }

    private function getCallbacks(): array
    {
        return [
            'tests_p_agreement' => [$this, 'copyAgreementQuestions'],
            'tests_p_gap' => [$this, 'copyGapQuestions'],
            'tests_p_gap_select' => [$this, 'copyGapSelectQuestions'],
            'tests_p_sequence' => [$this, 'copySequenceQuestions'],
            'tests_p_test' => [$this, 'copyTestQuestions'],
            'tests_p_text' => [$this, 'copyTextQuestions'],
        ];
    }

    private function dropInputValues(string $htmlString): string
    {
        $questionText = new DOMDocument();
        $questionText->loadHTML(
            mb_convert_encoding($htmlString, 'HTML-ENTITIES', 'UTF-8'),
            LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD
        );
        $inputs = $questionText->getElementsByTagName('input');
        for ($i = 0; $i < $inputs->length; $i++) {
            $input = $inputs->item($i);
            $input->setAttribute("value", "");
        }

        $questionText = html_entity_decode($questionText->saveHTML());

        if (!$questionText) {
            $questionText = $htmlString;
        }

        return $questionText;
    }
}

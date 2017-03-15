import processing.pdf.*;

QuestionPaper testPaper;

void setup()
{
  size (100, 100);

  testPaper = new QuestionPaper();

  testPaper.exportQuestionAndAnswerPapers(1);

  exit();
}
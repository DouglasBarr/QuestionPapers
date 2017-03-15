import processing.pdf.*;

QuestionPaper testPaper;

void setup()
{
  size (100, 100);

  testPaper = new QuestionPaper();

  testPaper.exportQuestionAndAnswerPapers(1);

  //PGraphics pdf = createGraphics(300, 300, PDF, "output.pdf");
  //pdf.beginDraw();
  //pdf.background(128, 0, 0);
  //pdf.line(50, 50, 250, 250);
  //pdf.dispose();
  //pdf.endDraw();

  exit();
}
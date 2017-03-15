
class QuestionPaper
{

  QuestionPaper()
  {
    firaLight = createFont("FiraSans-Light.otf", 34);
    textFont(firaLight);

    answers = new ArrayList();
  }



  public void exportQuestionAndAnswerPapers (int numberOfPapers)
  {
    for (int i = 0; i < numberOfPapers; i++)
    {
      int paperNo = i + 1;
      
      String questionPaperFileName = "BinaryToDecimalQuestions" + paperNo + ".pdf"; 

      drawQuestionPaper(questionPaperFileName);

      String answerPaperFileName = "BinaryToDecimalAnswers" + paperNo + ".pdf";  //<>//
      
      drawAnswerPaper(answerPaperFileName); //<>//

      answers.clear();
    }
  }

  private void drawQuestionPaper(String fileName)
  {
    graphicsBuffer = createGraphics(595, 842, PDF, fileName);  // Size of an A4 sheet at 72dpi
    graphicsBuffer.beginDraw();

    graphicsBuffer.background(255);

    //drawMarginGuides();

    graphicsBuffer.fill(0);

    int yPos = topBottomMargin;

    graphicsBuffer.textFont(firaLight);
    graphicsBuffer.textSize(28);
    graphicsBuffer.textAlign(LEFT, TOP);
    graphicsBuffer.text(title, sideMargin, yPos);

    yPos += 34;

    graphicsBuffer.textSize(22);
    graphicsBuffer.text(subTitle, sideMargin, yPos);

    yPos += 70;

    graphicsBuffer.textSize(18);
    graphicsBuffer.text("Convert the following binary numbers to decimal:", sideMargin, yPos);

    yPos += 55;

    //drawQuestion (1, yPos);

    for (int questionNumber = 1; questionNumber < numberOfQuestions + 1; questionNumber++)
    {
      drawQuestion (questionNumber, yPos);
      yPos += 40;
    }

    graphicsBuffer.dispose();
    graphicsBuffer.endDraw();
  }

  private void drawAnswerPaper(String fileName)
  {
    graphicsBuffer = createGraphics(595, 842, PDF, fileName);  // Size of an A4 sheet at 72dpi
    graphicsBuffer.beginDraw();

    graphicsBuffer.background(255);

    //drawMarginGuides();

    graphicsBuffer.fill(0);

    int yPos = topBottomMargin;

    graphicsBuffer.textFont(firaLight);
    graphicsBuffer.textSize(28);
    graphicsBuffer.textAlign(LEFT, TOP);
    graphicsBuffer.text(title + " - Answers", sideMargin, yPos);

    yPos += 34;

    graphicsBuffer.textSize(22);
    graphicsBuffer.text(subTitle, sideMargin, yPos);

    yPos += 70;

    graphicsBuffer.textSize(18);
    graphicsBuffer.text("The decimal values are:", sideMargin, yPos);

    yPos += 55;

    //drawQuestion (1, yPos);

    for (int questionNumber = 0; questionNumber < numberOfQuestions; questionNumber++)
    {
      drawAnswer (questionNumber, yPos);
      yPos += 40;
    }

    graphicsBuffer.dispose();
    graphicsBuffer.endDraw();
  }

  private void drawQuestion(int count, int yPos)
  {
    graphicsBuffer.pushMatrix();

    int number = int(random(256));

    answers.add(new Integer(number));

    println("Question " + count + " has value " + number);

    graphicsBuffer.translate(sideMargin, yPos);

    graphicsBuffer.text(count + ")", 0, 0);

    for (int i = 0; i < 4; i++)
    {
      graphicsBuffer.text(number >> i & 1, (130 - (i * 10)), 0);
    }

    for (int i = 4; i < 8; i++)
    {
      graphicsBuffer.text(number >> i & 1, (120 - (i * 10)), 0);//((i * 10) + 60), 0);
    }

    graphicsBuffer.popMatrix();
  }

  private void drawAnswer(int count, int yPos)
  {
    graphicsBuffer.pushMatrix();

    graphicsBuffer.translate(sideMargin, yPos);

    int answerToPrint = count + 1;

    graphicsBuffer.text(answerToPrint + ")", 0, 0);

    Integer valToPrint = (Integer) answers.get(count);
    graphicsBuffer.text(valToPrint, 40, 0);


    graphicsBuffer.popMatrix();
  }

  private void drawMarginGuides()
  {
    graphicsBuffer.stroke(#08E8FF);
    graphicsBuffer.strokeWeight(1);
    graphicsBuffer.line(0, topBottomMargin, width, topBottomMargin);
    graphicsBuffer.line(0, height - topBottomMargin, width, height - topBottomMargin);
    graphicsBuffer.line(sideMargin, 0, sideMargin, height);
    graphicsBuffer.line(width - sideMargin, 0, width - sideMargin, height);
  }

  private PGraphics graphicsBuffer;

  private int numberOfQuestions = 15;

  private int sideMargin = 15;
  private int topBottomMargin = 30;

  private PFont firaLight;

  private String title = "Binary to Decimal Conversion";
  private String subTitle = "Practice Questions";

  private ArrayList answers;
}
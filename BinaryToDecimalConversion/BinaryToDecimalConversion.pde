import processing.pdf.*;

int startAtPaperNumber = 1;
int numberOfQuestions = 15;

int sideMargin = 15;
int topBottomMargin = 30;

PFont firaLight;

String title = "Binary to Decimal Conversion";
String subTitle = "Practice Questions";

ArrayList answers;

void setup()
{
  size (595, 842);

  firaLight = createFont("FiraSans-Light.otf", 34);
  textFont(firaLight);
  
  answers = new ArrayList();

  //for (int i = 1; i < 10; i++)
  //{
    beginRecord(PDF, "BinaryToDecimalQuestions" + startAtPaperNumber + ".pdf");     // Start writing to PDF
      drawQuestionPaper();
    endRecord();                      // Stop writing to PDF
    
    
    beginRecord(PDF, "BinaryToDecimalAnswers" + startAtPaperNumber + ".pdf");     // Start writing to PDF
      drawAnswerPaper();
    endRecord();                      // Stop writing to PDF
    
    answers.clear();
  //}

  exit();
}

void drawQuestionPaper()
{
  background(255);

  //drawMarginGuides();

  fill(0);
  
  int yPos = topBottomMargin;
  
  textFont(firaLight);
  textSize(28);
  textAlign(LEFT, TOP);
  text(title, sideMargin, yPos);

  yPos += 34;

  textSize(22);
  text(subTitle, sideMargin, yPos);

  yPos += 70;

  textSize(18);
  text("Convert the following binary numbers to decimal:", sideMargin, yPos);

  yPos += 55;

  //drawQuestion (1, yPos);

  for (int questionNumber = 1; questionNumber < numberOfQuestions + 1; questionNumber++)
  {
    drawQuestion (questionNumber, yPos);
    yPos += 40;
  }
}

void drawAnswerPaper()
{
  background(255);

  //drawMarginGuides();

  fill(0);
  
  int yPos = topBottomMargin;
  
  textFont(firaLight);
  textSize(28);
  textAlign(LEFT, TOP);
  text(title + " - Answers", sideMargin, yPos);

  yPos += 34;

  textSize(22);
  text(subTitle, sideMargin, yPos);

  yPos += 70;

  textSize(18);
  text("The decimal values are:", sideMargin, yPos);

  yPos += 55;

  //drawQuestion (1, yPos);

  for (int questionNumber = 0; questionNumber < numberOfQuestions; questionNumber++)
  {
    drawAnswer (questionNumber, yPos);
    yPos += 40;
  }
  
}

void drawQuestion(int count, int yPos)
{
  pushMatrix();

    int number = int(random(256));
    
    answers.add(new Integer(number));
  
    println("Question " + count + " has value " + number);
  
    translate(sideMargin, yPos);
  
    text(count + ")", 0, 0);
  
    for (int i = 0; i < 4; i++)
    {
      text(number >> i & 1, (130 - (i * 10)), 0);
    }
  
    for (int i = 4; i < 8; i++)
    {
      text(number >> i & 1, (120 - (i * 10)), 0);//((i * 10) + 60), 0);
    }

  popMatrix();
}

void drawAnswer(int count, int yPos)
{
  pushMatrix();
  
  translate(sideMargin, yPos);

  int answerToPrint = count + 1;

  text(answerToPrint + ")", 0, 0);
  
  Integer valToPrint = (Integer) answers.get(count);
  text(valToPrint, 40, 0);


  popMatrix();
}
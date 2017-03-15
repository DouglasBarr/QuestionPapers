void drawMarginGuides()
{
  stroke(#08E8FF);
  strokeWeight(1);
  line(0, topBottomMargin, width, topBottomMargin);
  line(0, height - topBottomMargin, width, height - topBottomMargin);
  line(sideMargin, 0, sideMargin, height);
  line(width - sideMargin, 0, width - sideMargin, height);
}
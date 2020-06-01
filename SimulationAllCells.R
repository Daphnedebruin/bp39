#Total number of cells
TotalCells <- nrow(Design)
for (i in 1:TotalCells){
  effect= Design[i,3]
  Row <- i
  MyResult <- MySimulationCell(Design = Design, RowOfDesign = Row, K = 2 )
  # Write output of one cell of the design
  save(MyResult, file =file.path("results",paste0("MyResult", "Row", Row,".Rdata" , sep ="")))
}

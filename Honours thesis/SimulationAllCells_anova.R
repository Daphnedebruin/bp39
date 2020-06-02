#Total number of cells
TotalCells <- nrow(Design)
for (i in 1:TotalCells){
  print(i)
  effect= Design[i,3]
  Row <- i
  MyResult <- MySimulationCell(Design = Design, RowOfDesign = Row, K = 1000 )
  # Write output of one cell of the design
  #print(MyResult)
  save(MyResult, file =file.path(paste0("MyResult", "Row", Row,".Rdata" , sep ="")))
}



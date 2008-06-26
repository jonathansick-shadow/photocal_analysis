{ 
  printf("DROP TABLE DiaSourceToObjectMatches_visit%s;\n",$1);
  printf("DROP TABLE DiaSources_visit%s;\n",$1);
  printf("DROP TABLE MopsPredToDiaSourceMatches_visit%s;\n",$1);
  printf("DROP TABLE MopsPreds_visit%s;\n",$1);
  printf("DROP TABLE NewObjectIdPairs_visit%s;\n",$1);
}

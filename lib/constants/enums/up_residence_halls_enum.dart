// This might be deprecated in the future in favor of the admin/seller side
// creating the residence hall entities in the database.
enum UpResidenceHalls {
  acacia(labelName: 'Acacia RH'),
  balayAtleta(labelName: 'Balay Atleta RH'),
  centennial_1(labelName: 'Centennial 1 RH'),
  centennial_2(labelName: 'Centennial 2 RH'),
  ipil(labelName: 'Ipil RH'),
  kalayaan(labelName: 'Kalayaan RH'),
  kamagong(labelName: 'Kamagong RH'),
  sampaguita(labelName: 'Sampaguita RH'),
  sanggumay(labelName: 'Sanggumay RH');

  const UpResidenceHalls({required this.labelName});
  final String labelName;
}

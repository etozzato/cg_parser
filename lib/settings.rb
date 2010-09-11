module Settings
  
  APPLICATIONS = %w(alfa-romeo my-audi my-bmw my-ferrari my-fiat my-ford my-jeep my-landrover my-toyota my-volvo myacura mycadillac mychevrolet mychrysler mydodge mygmc myhonda myhummer myjaguar mylexus mylotus mymaserati mymazda mymercedes-benz mymini mymitsubishi mynissan myporsche myrover mysaab mysmart mysubaru myvolkswagen)
  
  CAT = 'cta'
  
  MAKERS = {
    :alfaromeo => {
      :title=> 'Alfa-Romeo',
      :reg_exp =>'(^| )alfa.?romeo($| )'},
    :myaudi => {
      :title=> 'Audi',
      :reg_exp =>'(^| )audi($| )'},
    :mybmw => {
      :title=> 'Bmw',
      :reg_exp =>'(^| )bmw($| )'},
    :myferrari => {
      :title=> 'Ferrari',
      :reg_exp =>'(^| )ferrari($| )'},
    :myfiat => {
      :title=> 'Fiat',
      :reg_exp =>'(^| )fiat($| )'},
    :myford => {
      :title=> 'Ford',
      :reg_exp =>'(^| )ford($| )'},
    :myjeep => {
      :title=> 'Jeep',
      :reg_exp =>'(^| )jeep($| )'},
    :mylandrover => {
      :title=> 'Landrover',
      :reg_exp =>'(^| )land.?rover($| )'},
    :mytoyota => {
      :title=> 'Toyota',
      :reg_exp =>'(^| )toyota($| )'},
    :myvolvo => {
      :title=> 'Volvo',
      :reg_exp =>'(^| )volvo($| )'},
    :myacura => {
      :title=> 'Acura',
      :reg_exp =>'(^| )acura($| )'},
    :mycadillac => {
      :title=> 'Cadillac',
      :reg_exp =>'(^| )cadillac($| )'},
    :mychevrolet => {
      :title=> 'Chevrolet',
      :reg_exp =>'(^| )chevrolet($| )'},
    :mychrysler => {
      :title=> 'Chrysler',
      :reg_exp =>'(^| )chrysler($| )'},
    :mydodge => {
      :title=> 'Dodge',
      :reg_exp =>'(^| )dodge($| )'},
    :mygmc => {
      :title=> 'Gmc',
      :reg_exp =>'(^| )gmc($| )'},
    :myhonda => {
      :title=> 'Honda',
      :reg_exp =>'(^| )honda($| )'},
    :myhummer => {
      :title=> 'Hummer',
      :reg_exp =>'(^| )hummer($| )'},
    :myjaguar => {
      :title=> 'Jaguar',
      :reg_exp =>'(^| )jaguar($| )'},
    :mylexus => {
      :title=> 'Lexus',
      :reg_exp =>'(^| )lexus($| )'},
    :mylotus => {
      :title=> 'Lotus',
      :reg_exp =>'(^| )lotus($| )'},
    :mymaserati => {
      :title=> 'Maserati',
      :reg_exp =>'(^| )maserati($| )'},
    :mymazda => {
      :title=> 'Mazda',
      :reg_exp =>'(^| )mazda($| )'},
    :mymercedesbenz => {
      :title=> 'Mercedes-Benz',
      :reg_exp =>'(^| )mercedes.?benz|mercedes($| )'},
    :mymini => {
      :title=> 'Mini Cooper',
      :reg_exp =>'(^| )mini.?cooper($| )'},
    :mymitsubishi => {
      :title=> 'Mitsubishi',
      :reg_exp =>'(^| )mitsubishi($| )'},
    :mynissan => {
      :title=> 'Nissan',
      :reg_exp =>'(^| )nissan($| )'},
    :myporsche => {
      :title=> 'Porsche',
      :reg_exp =>'(^| )porsche($| )'},
    :myrover => {
      :title=> 'Rover',
      :reg_exp =>'(^| )rover($| )'},
    :mysaab => {
      :title=> 'Saab',
      :reg_exp =>'(^| )saab($| )'},
    :mysmart => {
      :title=> 'Smart',
      :reg_exp =>'(^| )smart($| )'},
    :mysubaru => {
      :title=> 'Subaru',
      :reg_exp =>'(^| )subaru($| )'},
    :myvolkswagen => {
      :title=> 'Volkswagen',
      :reg_exp =>'(^| )volkswagen|vw($| )'},

  }
  
  # APPLICATIONS.each do |app|
  #  puts ":#{app.clean} => {\n  :title=> '#{app.gsub(/my-?/,'').title}',\n  :reg_exp =>'(^| )#{app.gsub(/my-?/,'')}($| )'},"
  # #puts "127.0.0.1 #{app}.us"
  # end
  
end
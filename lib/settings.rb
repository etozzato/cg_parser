module Settings

  ATOM_URL = 'http://www.google.com/reader/public/atom/user/14501400005472834064/bundle/mymy'

  AppBase = 'http://my-my.us'

  # APPLICATIONS = %w(alfa-romeo my-audi my-bmw my-ferrari my-fiat my-ford my-jeep my-landrover my-toyota my-volvo myacura mycadillac mychevrolet mychrysler mydodge mygmc myhonda myhummer myjaguar mylexus mylotus mymaserati mymazda mymercedes-benz mymini mymitsubishi mynissan myporsche myrover mysaab mysmart mysubaru myvolkswagen)

APPLICATIONS = %w(alfaromeo audi bmw ferrari fiat ford jeep landrover toyota volvo acura cadillac chevrolet chrysler dodge gmc honda hummer jaguar lexus lotus maserati mazda mercedes mini mitsubishi nissan porsche rover saab smart subaru volkswagen)

  CAT = 'cto'

  MAKERS = {
    :alfaromeo => {
      :title=> 'Alfa-Romeo',
      :reg_exp =>'(^| )alfa.?romeo($| )'},
    :audi => {
      :title=> 'Audi',
      :reg_exp =>'(^| )audi($| )'},
    :bmw => {
      :title=> 'Bmw',
      :reg_exp =>'(^| )bmw($| )'},
    :ferrari => {
      :title=> 'Ferrari',
      :reg_exp =>'(^| )ferrari($| )'},
    :fiat => {
      :title=> 'Fiat',
      :reg_exp =>'(^| )fiat($| )'},
    :ford => {
      :title=> 'Ford',
      :reg_exp =>'(^| )ford($| )'},
    :jeep => {
      :title=> 'Jeep',
      :reg_exp =>'(^| )jeep($| )'},
    :landrover => {
      :title=> 'Landrover',
      :reg_exp =>'(^| )land.?rover($| )'},
    :toyota => {
      :title=> 'Toyota',
      :reg_exp =>'(^| )toyota($| )'},
    :volvo => {
      :title=> 'Volvo',
      :reg_exp =>'(^| )volvo($| )'},
    :acura => {
      :title=> 'Acura',
      :reg_exp =>'(^| )acura($| )'},
    :cadillac => {
      :title=> 'Cadillac',
      :reg_exp =>'(^| )cadillac($| )'},
    :chevrolet => {
      :title=> 'Chevrolet',
      :reg_exp =>'(^| )chevrolet($| )'},
    :chrysler => {
      :title=> 'Chrysler',
      :reg_exp =>'(^| )chrysler($| )'},
    :dodge => {
      :title=> 'Dodge',
      :reg_exp =>'(^| )dodge($| )'},
    :gmc => {
      :title=> 'Gmc',
      :reg_exp =>'(^| )gmc($| )'},
    :honda => {
      :title=> 'Honda',
      :reg_exp =>'(^| )honda($| )'},
    :hummer => {
      :title=> 'Hummer',
      :reg_exp =>'(^| )hummer($| )'},
    :jaguar => {
      :title=> 'Jaguar',
      :reg_exp =>'(^| )jaguar($| )'},
    :lexus => {
      :title=> 'Lexus',
      :reg_exp =>'(^| )lexus($| )'},
    :lotus => {
      :title=> 'Lotus',
      :reg_exp =>'(^| )lotus($| )'},
    :maserati => {
      :title=> 'Maserati',
      :reg_exp =>'(^| )maserati($| )'},
    :mazda => {
      :title=> 'Mazda',
      :reg_exp =>'(^| )mazda($| )'},
    :mercedes => {
      :title=> 'Mercedes-Benz',
      :reg_exp =>'(^| )mercedes.?benz|mercedes($| )'},
    :mini => {
      :title=> 'Mini',
      :reg_exp =>'(^| )mini.?cooper($| )'},
    :mitsubishi => {
      :title=> 'Mitsubishi',
      :reg_exp =>'(^| )mitsubishi($| )'},
    :nissan => {
      :title=> 'Nissan',
      :reg_exp =>'(^| )nissan($| )'},
    :porsche => {
      :title=> 'Porsche',
      :reg_exp =>'(^| )porsche($| )'},
    :rover => {
      :title=> 'Rover',
      :reg_exp =>'(^| )rover($| )'},
    :saab => {
      :title=> 'Saab',
      :reg_exp =>'(^| )saab($| )'},
    :smart => {
      :title=> 'Smart',
      :reg_exp =>'(^| )smart($| )'},
    :subaru => {
      :title=> 'Subaru',
      :reg_exp =>'(^| )subaru($| )'},
    :volkswagen => {
      :title=> 'Volkswagen',
      :reg_exp =>'(^| )volkswagen|vw($| )'},
  }
  
  # APPLICATIONS.each do |app|
  #  puts ":#{app.clean} => {\n  :title=> '#{app.gsub(/my-?/,'').title}',\n  :reg_exp =>'(^| )#{app.gsub(/my-?/,'')}($| )'},"
  # #puts "127.0.0.1 #{app}.us"
  # end
  
end
# class String
#   def clean(sub='')
#     return self.gsub(/\W/,sub)
#   end
#   
#   def title
#     return self[0].upcase + self[1..-1].downcase
#   end
# end
module Settings
  
  APPLICATIONS = %w(my-audi my-bmw my-ferrari my-ford my-jeep my-landrover my-toyota my-volvo myacura mycadillac mychevrolet mychrysler mydodge mygmc myhonda myhummer myjaguar mylexus mylotus mymaserati mymazda mymercedes-benz mymini mymitsubishi mynissan myporsche myrover mysaab mysmart mysubaru myvolkswagen)
  
  CAT = 'cta'
  
  MARKETS = {
    :albany        =>'Albany',
    :allentown     =>'Allentown',
    :albuquerque   =>'Albuquerque',
    :anchorage     =>'Anchorage',
    :annarbor      =>'Ann Arbor',
    :asheville     =>'Asheville',
    :atlanta       =>'Atlanta',
    :austin        =>'Austin',
    :bakersfield   =>'Bakersfield',
    :baltimore     =>'Baltimore',
    :batonrouge    =>'Baton Rouge',
    :bham          =>'Birmingham',
    :boise         =>'Boise',
    :boston        =>'Boston',
    :buffalo       =>'Buffalo',
    :burlington    =>'Burlington',
    :chambana      =>'Champaign Urbana',
    :charleston    =>'Charleston',
    :charlotte     =>'Charlotte',
    :chicago       =>'Chicago',
    :chico         =>'Chico',
    :cincinnati    =>'Cincinnati',
    :cleveland     =>'Cleveland',
    :columbia      =>'Columbia, S.C.',
    :columbus      =>'Columbus',
    :dallas        =>'Dallas',
    :delaware      =>'Delaware',
    :dayton        =>'Dayton',
    :denver        =>'Denver / Boulder',
    :desmoines     =>'Des moines',
    :detroit       =>'Detroit',
    :elpaso        =>'El Paso',
    :eugene        =>'Eugene',
    :fortmyers     =>'Fort Myers / SW Florida',
    :fresno        =>'Fresno',
    :grandrapids   =>'Grand Rapids',
    :greensboro    =>'Greensboro',
    :harrisburg    =>'Harrisburg',
    :hartford      =>'Hartford',
    :houston       =>'Houston',
    :honolulu      =>'Honolulu',
    :humboldt      =>'Humboldt',
    :indianapolis  =>'Indianapolis',
    :inlandempire  =>'Inland Empire',
    :ithaca        =>'Ithaca',
    :jackson       =>'Jackson',
    :jacksonville  =>'Jacksonville',
    :kansascity    =>'Kansas City',
    :knoxville     =>'Knoxville',
    :littlerock    =>'Little Rock',
    :lasvegas      =>'Las Vegas',
    :lexington     =>'Lexington',
    :losangeles    =>'Los Angeles',
    :louisville    =>'Louisville',
    :maine         =>'Maine',
    :madison       =>'Madison',
    :memphis       =>'Memphis',
    :miami         =>'Miami',
    :milwaukee     =>'Milwaukee',
    :minneapolis   =>'Minneapolis',
    :mobile        =>'Mobile',
    :modesto       =>'Modesto',
    :montana       =>'Montana',
    :monterey      =>'Monterey',
    :montgomery    =>'Montgomery',
    :nashville     =>'Nashville',
    :nh            =>'New Hampshire',
    :newhaven      =>'New Haven',
    :newjersey     =>'New Jersey',
    :newyork       =>'New York City',
    :neworleans    =>'New Orleans',
    :norfolk       =>'Norfolk',
    :nd            =>'North Dakota',
    :oklahomacity  =>'Oklahoma City',
    :omaha         =>'Omaha',
    :omaha         =>'Omaha',
    :orangecounty  =>'Orange County',
    :orlando       =>'Orlando',
    :pensacola     =>'Pensacola',
    :philadelphia  =>'Philadelphia',
    :phoenix       =>'Phoenix',
    :pittsburgh    =>'Pittsburgh',
    :portland      =>'Portland',
    :puertorico    =>'Puerto Rico',
    :providence    =>'Providence',
    :raleigh       =>'Raleigh',
    :redding       =>'Redding',
    :reno          =>'Reno',
    :richmond      =>'Richmond',
    :rochester     =>'Rochester',
    :sacramento    =>'Sacramento',
    :saltlakecity  =>'Salt Lake City',
    :sanantonio    =>'San Antonio',
    :sandiego      =>'San Diego',
    :sfbay         =>'San Francisco Bay Area',
    :slo           =>'San Luis Obispo',
    :santabarbara  =>'Santa Barbara',
    :savannah      =>'Savannah',
    :seattle       =>'Seattle-Tacoma',
    :shreveport    =>'Shreveport',
    :sd            =>'South Dakota',
    :spokane       =>'Spokane',
    :stlouis       =>'St. Louis',
    :stockton      =>'Stockton',
    :syracuse      =>'Syracuse',
    :tallahassee   =>'Tallahassee',
    :tampa         =>'Tampa',
    :toledo        =>'Toledo',
    :tucson        =>'Tucson',
    :tulsa         =>'Tulsa',
    :washingtondc  =>'Washington D.C.',
    :westernmass   =>'Western Massachusetts',
    :westpalmbeach =>'West Palm Beach',
    :wv            =>'West Virginia',
    :wichita       =>'Wichita',
    :wyoming       => 'Wyoming'
  }
  
  CONFIG = {
    :myaudi => {
      :title=> 'Audi',
      :reg_exp =>'(^| )audi($| )'},
    :mybmw => {
      :title=> 'Bmw',
      :reg_exp =>'(^| )bmw($| )'},
    :myferrari => {
      :title=> 'Ferrari',
      :reg_exp =>'(^| )ferrari($| )'},
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
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#Auctions.create!(date: "12/12/2019",hour: "13:00", cost: 200, uf: 2, pesos:0,total_minimum: 0,warranty: 12,fee: 23, name: 'prueba', lyrics: 'prueba',number: 1 ,year: 1990, auctionnotice_id: 1,realty_id: 1, court_id: 1, minimum: 0, status: 0 ) if Rails.env.development?
Court.create!( rut: '60.306.001-6',name: '01º Juzgado Civil de Santiago',address: 'Huérfanos 1409 - 1º Piso - Santiago',phone: '2226746203',account: 9733);
Court.create!( rut: '60.306.002-4',name: '02º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 1º Piso- Santiago',phone: '22 26746213',account: 9741);
Court.create!( rut: '60.306.003-2',name: '03º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 1º Piso- Santiago',phone: '2226746223',account: 9725);
Court.create!( rut: '60.306.004-0',name: '04º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 2º Piso - Santiago',phone: '22 26746233',account: 163082);
Court.create!( rut: '60.306.005-9',name: '05º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 2º Piso - Santiago',phone: '2226746243',account: 9717);
Court.create!( rut: '60.306.006-7',name: '06º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 2º Piso - Santiago',phone: '2226746253',account: 163163);
Court.create!( rut: '60.306.007-5',name: '07º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 2º Piso - Santiago',phone: '22 26746263',account: 163171);
Court.create!( rut: '60.306.008-3',name: '08º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 3º Piso - Santiago',phone: '22 26746273',account: 9687);
Court.create!( rut: '60.309.014-4',name: '09º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 3º Piso - Santiago',phone: '2226746283',account: 9679);
Court.create!( rut: '60.306.010-5',name: '10º Juzgado Civil de Santiago',address: 'Huerfanos Nº 1409 - 3º Piso - Santiago',phone: '2226746293',account: 9709);
Court.create!( rut: '60.306.011-3',name: '11º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 3º Piso - Santiago',phone: '2226746303',account: 9695);
Court.create!( rut: '60.306.012-1',name: '12º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 4º Piso - Santiago',phone: '2226746313',account: 163112);
Court.create!( rut: '60.306.013-K',name: '13º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 4º Piso - Santiago',phone: '226746322',account: 163104);
Court.create!( rut: '60.306.014-8',name: '14º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 4º Piso - Santiago',phone: '2226746335',account: 163121);
Court.create!( rut: '60.306.062-8',name: '15º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 4º Piso - Santiago',phone: '2226746343',account: 163465);
Court.create!( rut: '60.306.064-4',name: '16º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 4º Piso - Santiago',phone: '22 26746353',account: 163449);
Court.create!( rut: '60.306.066-0',name: '17º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 5º Piso -Santiago',phone: '2226746363',account: 163473);
Court.create!( rut: '60.306.056-3',name: '18º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 5º Piso - Santiago',phone: '2226746373',account: 163422);
Court.create!( rut: '60.306.076-8',name: '19º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 5º Piso - Santiago',phone: '2226746383',account: 163490);
Court.create!( rut: '61.962.700-8',name: '20º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 5º Piso - Santiago',phone: '2226746393',account: 163554);
Court.create!( rut: '60.306.065-2',name: '21º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 5º Piso - Santiago',phone: '2226746403',account: 163503);
Court.create!( rut: '60.306.057-1',name: '22º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 6º Piso - Santiago',phone: '2226746413',account: 163520);
Court.create!( rut: '60.306.058-K',name: '23º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 7º Piso - Santiago',phone: '2226746423',account: 163571);
Court.create!( rut: '61.933.300-4',name: '24º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 8º Piso - Santiago',phone: '2226746433',account: 163431);
Court.create!( rut: '60.306.072-5',name: '25º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 9º Piso - Santiago',phone: '2226746443',account: 129941);
Court.create!( rut: '60.306.069-5',name: '26º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 10º Piso -Santiago',phone: '2226746453',account: 169471);
Court.create!( rut: '60.306.070-9',name: '27º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 11º Piso - Santiago',phone: '2226746463',account: 169463);
Court.create!( rut: '60.306.073-3',name: '28º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 12º Piso - Santiago',phone: '2226746473',account: 130109);
Court.create!( rut: '60.306.074-1',name: '29º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 13º Piso - Santiago',phone: '2226746483',account: 130192);
Court.create!( rut: '60.306.075-K',name: '30º Juzgado Civil de Santiago',address: 'Huérfanos Nº 1409 - 14º Piso - Santiago',phone: '2226746493',account: 130214);
Court.create!( rut: '60.306.037-7',name: '01º Juzgado Civil de San Miguel',address: 'Salesianos 1180 - San Miguel',phone: '2225246407',account: 6302939);
Court.create!( rut: '60.306.038-5',name: '02º Juzgado Civil de San Miguel',address: 'Salesianos Nº 1180',phone: '2225241493',account: 6302785);
Court.create!( rut: '60.306.054-7',name: '03º Juzgado Civil de San Miguel',address: 'Gran Avda. J.M. Carrera Nº 5811',phone: '2225211323',account: 6305784);
Court.create!( rut: '60.316.000-2',name: '04º Juzgado Civil de San Miguel',address: 'Salesianos Nº 1180',phone: '2225222015',account: 6318011);
Court.create!( rut: '60.306.041-5',name: '01º Juzgado Civil de Puente Alto',address: 'Manuel Rodriguez N° 0169 - Puente Alto',phone: '2224987950',account: 7302061);
Court.create!( rut: '60.306.040-7',name: '01º Juzgado de Letras de San Bernardo',address: 'Urmeneta Nº 467',phone: '2228591539',account: 7082746);
Court.create!( rut: '60.306.051-2',name: '02º Juzgado de Letras de San Bernardo',address: 'Urmeneta Nº 467',phone: '228593446',account: 7086806);
Court.create!( rut: '61.939.600-6',name: 'Juzgado de Letras de Peñaflor',address: 'María Ester Garay Nº 135 - Peñaflor',phone: '2228129097',account: 7233850);
Court.create!( rut: '61.939.500-K',name: 'Juzgado de Letras de Colina',address: 'Chacabuco Nº 91 - Colina',phone: '2224839800',account: 3793591);
Court.create!( rut: '61.977.960-6',name: '04º Juzgado de Familia de Santiago',address: 'GENERAL MACKENNA N°1477 - PISO N°10 - SANTIAGO',phone: '224977400',account: 1956523);
Court.create!( rut: '61.978.490-1',name: 'Juzgado de Cobranza Laboral y Previsional de Santiago',address: 'San Martin 950, sala Nº 8, Santiago',phone: '7683400',account: 1956671);
Court.create!( rut: '61.979.570-9',name: 'Juzgado de Letras de Trabajo de San Bernardo',address: 'Urmeneta 467 3° piso San Bernardo',phone: '2 28790320 ',account: 7134835);
Court.create!( rut: '65.618.500-7',name: 'Juzgado de Cobranza Laboral y Previsional de San Miguel',address: 'Ureta Cox 855 1º piso, San Miguel',phone: '22 5568658',account: 6372082);
Court.create!( rut: '65.549.030-2',name: '1º Juzgado de Familia de Santiago',address: 'GENERAL MACKENNA N°1477 - PISO N° 7 - SANTIAGO',phone: '224977100',account: 1956485);
Court.create!( rut: '61.978.020-5',name: '1º Juzgado de Familia de San Miguel',address: 'ÁLVAREZ DE TOLEDO N° 1020 - SAN MIGUEL',phone: '227684500',account: 6368107);

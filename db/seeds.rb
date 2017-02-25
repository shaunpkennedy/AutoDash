# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Service Types
ServiceType.create name: 'Oil Change'
ServiceType.create name: 'Tire Rotation'
ServiceType.create name: 'Filter'
ServiceType.create name: 'Service'
ServiceType.create name: 'Other'

puts 'Created service types.'

puts 'Loading FuelLogs'

Auto.create(title: 'Test Auto', current_odometer: '50000', id: '999', oil_change_frequency: '5000', tire_rotation_frequency: '7500')

Fuellog.create(log_date: DateTime.parse('1/1/2017' ), odometer: '50000', ppg: '2.359', gallons: '10',  total_cost: '23.59', miles: '300', mpg: '30.0', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('1/13/2017'), odometer: '50324', ppg: '2.000', gallons: '8	', total_cost:  '16.00', miles: '324', mpg: '40.5', auto_id: '1')
Fuellog.create(log_date: DateTime.parse('1/25/2017'), odometer: '50637', ppg: '1.000', gallons: '15',  total_cost: '15.00', miles: '313', mpg: '20.9', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('2/6/2017' ), odometer: '50921', ppg: '3.000', gallons: '15',  total_cost: '45.00', miles: '284', mpg: '18.9', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('2/18/2017'), odometer: '51173', ppg: '2.000', gallons: '13',  total_cost: '26.00', miles: '252', mpg: '19.4', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('3/2/2017' ), odometer: '51513', ppg: '2.000', gallons: '11',  total_cost: '22.00', miles: '340', mpg: '30.9', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('3/14/2017'), odometer: '51778', ppg: '1.000', gallons: '8	', total_cost:  '8.002', miles: '65', mpg: '33.1', auto_id: '1' )
Fuellog.create(log_date: DateTime.parse('3/26/2017'), odometer: '52090', ppg: '4.000', gallons: '10',  total_cost: '40.00', miles: '312', mpg: '31.2', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('4/7/2017' ), odometer: '52382', ppg: '3.000', gallons: '15',  total_cost: '45.00', miles: '292', mpg: '19.5', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('4/19/2017'), odometer: '52596', ppg: '3.000', gallons: '10',  total_cost: '30.00', miles: '214', mpg: '21.4', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('5/1/2017' ), odometer: '52796', ppg: '4.000', gallons: '9	', total_cost:  '36.00', miles: '200', mpg: '22.2', auto_id: '1')
Fuellog.create(log_date: DateTime.parse('5/13/2017'), odometer: '53010', ppg: '2.000', gallons: '13',  total_cost: '26.00', miles: '214', mpg: '16.5', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('5/25/2017'), odometer: '53316', ppg: '2.000', gallons: '9	', total_cost:  '18.00', miles: '306', mpg: '34.0', auto_id: '1')
Fuellog.create(log_date: DateTime.parse('6/6/2017' ), odometer: '53517', ppg: '2.000', gallons: '8	', total_cost:  '16.00', miles: '201', mpg: '25.1', auto_id: '1')
Fuellog.create(log_date: DateTime.parse('6/18/2017'), odometer: '53726', ppg: '2.000', gallons: '14',  total_cost: '28.00', miles: '209', mpg: '14.9', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('6/30/2017'), odometer: '53980', ppg: '4.000', gallons: '7	', total_cost:  '28.00', miles: '254', mpg: '36.3', auto_id: '1')
Fuellog.create(log_date: DateTime.parse('7/12/2017'), odometer: '54212', ppg: '2.000', gallons: '13',  total_cost: '26.00', miles: '232', mpg: '17.8', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('7/24/2017'), odometer: '54415', ppg: '4.000', gallons: '9	', total_cost:  '36.00', miles: '203', mpg: '22.6', auto_id: '1')
Fuellog.create(log_date: DateTime.parse('8/5/2017' ), odometer: '54638', ppg: '4.000', gallons: '14',  total_cost: '56.00', miles: '223', mpg: '15.9', auto_id: '1'  )
Fuellog.create(log_date: DateTime.parse('8/17/2017'), odometer: '54942', ppg: '1.000', gallons: '11',  total_cost: '11.00', miles: '304', mpg: '27.6', auto_id: '1'  )

puts 'Finished loading FuelLogs'
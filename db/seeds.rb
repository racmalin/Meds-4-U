User.all.delete
DiseaseState.all.delete
Medication.all.delete


doxil = Medication.create(name: 'Doxil')
bob = User.create(username: 'Bob', password: 'password')
cancer = DiseaseState.create(name: 'cancer', type: 'carcinoma', category: 'fatal', user_id: bob, medication_id: doxil)






# medications = [
#     {name: 'med name', type: 'med type', brand: 'med brand', user: bob }
# ]

# medications.each do |m|
#     Medication.create(m)
# end




  

  
  





doxil = Medication.create(name: 'Doxil')
bob = User.create(username: 'Bob', password_digest: 'password')
cancer = DiseaseState.create(name: 'cancer', disease_type: 'carcinoma', category: 'fatal', user_id: bob, medication_id: doxil)






# medications = [
#     {name: 'med name', type: 'med type', brand: 'med brand', user: bob }
# ]

# medications.each do |m|
#     Medication.create(m)
# end




  

  
  

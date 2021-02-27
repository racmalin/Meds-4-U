
doxil = Medication.create!(name: 'Doxil')
bob = User.create!(username: 'Bob', password_digest: 'password')
cancer = DiseaseState.create!(name: 'cancer', disease_type: 'carcinoma', category: 'fatal', user_id: bob.id, medication_id: doxil.id)











  

  
  

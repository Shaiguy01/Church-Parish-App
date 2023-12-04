select * from ParishTable where personFirstName = '' OR personLastName = '' OR personAge = 49;

-------------------------------------insert parish member/person into the table
insert into ParishTable
(personFirstName, personLastName, 
personAge, gender, dateOfBirth,
contactNumber, email, houseNumber,
roadName, suburb, Occupation,
TimeAndTalents, PreferredMassTime, stewardship)
Values
('shahil', 'jagjivan', 22, 
'male', '2001-01-01', 0813858437,
'shahiljagjivan@gmail.com', 15, 'Garuda Avenue', 
'Chatsworth', 'company intern', 'consistant', 'Saturday', 'yes');

--------------------------------------search person by name
select personFirstName, personLastName from ParishTable
where personFirstName = 'SHAHIL' and personLastName = 'Jagjivan';

--------------------------------------search person by last name
select personLastName from ParishTable
where personLastName = 'JAGJIVAN'

--------------------------------------delete person from table
delete from ParishTable where personID = 6 and personFirstName = 'shahil';
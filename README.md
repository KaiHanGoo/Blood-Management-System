The project is about a database for blood donating systems and below are a few pieces of information that have been collected in each category.

1. Donor: 
A donor is the person who donates his/her blood. Each donor can have many donations and their basic information is recorded for tracing. Each donor has a unique ID and the data stored on the Donor are donor IC, donor name, donor address, donor postcode, donor city, state, and donor phone number, Donor Details are donor gender, donor blood type, donor rhesus, donor weight and donor qualification.

2. Donation
Donation is the blood donated by the donor and each donor can make many donations. Each staff also could be in charge of many donations and the blood bank has stored many donations. Each donation has a unique ID and connects with the donor ID, staff ID and blood ID for more detailed tracking. The data stored on Donation are blood type, blood rhesus, blood quantity, donate date and the donate place.

3. Staff
Staff are the people who manage part of the system. Staff can be categorized into two positions, admin, and staff. Admin can make changes and modify the information while staff could only key in the data. Each staff can be in charge of many donations record and many staff could together manage one blood bank. Each staff also have a unique ID of their own. The data stored on Staff are staff name, staff position, staff address, staff postcode, staff city and state, staff phone number and staff gender.

4. Blood Bank
A blood bank is a place which stored all the donations. The donations include all blood types and one blood bank has many donations and bloodstock available. A blood bank is also managed by many staff and the blood bank has many requests for bloodstock. In the blood bank, each pack of blood will have their unique ID and the staff ID for tracing. The data stored in the Blood Bank are blood type, blood rhesus and blood quantity.

5. Blood Detail
Blood Detail is the number of available blood packs. Many blood details are stored inside a blood bank. Each blood detail has a unique ID and uses a Blood ID as a reference. The data stored on Blood Detail are distributed date and expiration date.

6. Request Detail
Request Detail is the details of the requested blood detail by the hospital, and the blood stocks are taken from the blood bank. It records the request from the hospital and the latest date when the blood bank supplies blood stock on the regular basis. Inside Request Detail, it uses Blood ID and Hospital ID as a reference and the data stored on Request Details are request quantity and last update date.

7. Hospital
A hospital is an organization which requests blood for emergency and basic medical treatment. Each hospital will record many recipients of the blood and each hospital has many requests for blood detail in an emergency or basic restock needs. Each hospital has a unique ID for easy recognition and the data stored on the Hospital are hospital address, hospital city and state, hospital postcode, hospital dial number and hospital name.

8. Recipient
A recipient is a person who uses the blood detail in an emergency or basic medical treatment. Massive records of blood usage are recorded in the hospital. Each recipient has a unique ID and uses Staff ID and Hospital ID as references. The data stored on Recipient are Recipient name, recipient age, recipient gender, recipient blood type, received blood amount and received date.

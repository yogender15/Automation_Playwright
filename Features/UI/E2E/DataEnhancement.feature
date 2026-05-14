@UI
Feature: DataEnhancement

  Background:
    Given User uses test data with ID 'DE_001' from 'DataEnhancement' sheet

@Regression @DataEnhancement @P1_C @E2E @mini_Regression @HP_E2E
#CTPRELMGMT-1635	Data Enhancement - Amend Committed PAD Set at Desktop Research
#CTPRELMGMT-1607	E2E Data Enhancement - Full process of Amending a Committed PAD set
Scenario:DE01_CTPRELMGMT-1607_CTPRELMGMT-1635_E2E Data Enhancement - Full process of Amending a Committed PAD set
	Given User is logged in to Dynamics application to work for "E2E_Committed_Amend_DE" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire_DE'
		| fieldName |
		| uprn      |
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User scroll to 'Billing Authority Link' element
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	#And User 'Assign' job to self on 'Assign Desktop Research' pop-up
	#And user waits till app progress indicator disappears
	#And User validates Knowledge Section in the 'Researching' stage
	#	| KnowledgeSection                      |
	#	| PAD Effective Date flow chart         |
	#	| Property validation matrix            |
	#	| BAs where flats not measured to EFA   |
	#	| Property Details Guide                |
	#	| Quick Guide to Property Details Guide |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User enter Property Attributes

	#And User looked for 'Group' field value only when data not entered
	#And User looked for 'Type' field value only when data not entered
	#And User looked for first element 'Age Code' field value only when data not entered
	#And User enter data for 'Area' field value
	#And User enter data for 'Rooms' field value
	#And User enter data for 'Bedrooms' field value
	#And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status     |
		| Committed  |
		| Superseded |
	Then user asserts "Effective Date","Effective To" for "Amend" records
		| fromDateColumn               | effectiveToDateColumn        | status     |
		| EffectiveFromDate |                              | Committed  |
		| EffectiveFromDate            | EffectiveFromDate | Superseded |
	And User closes browser

@Regression @DataEnhancement @P1_C @E2E @HP_E2E
#CTPRELMGMT-1636_Data Enhancement - New Pending PAD Set at Desktop Research
#CTPRELMGMT-1631_E2E Data Enhancement - Data Enhancement Job created and completed through Release and Publish with Pending PAD set
#CTPRELMGMT-1629	E2E Data Enhancement - Release and Publish Changed Date of Pending PAD Set
#CTPRELMGMT-1606	E2E Data Enhancement - Full process of Editing the date of a Pending PAD set
Scenario:DE02_CTPRELMGMT-1636_CTPRELMGMT-1631_CTPRELMGMT-1629_CTPRELMGMT-1606_E2E Data Enhancement - Data Enhancement Job created and completed through Release and Publish with Pending PAD set
	Given User is logged in to Dynamics application to work for "E2E_Pending_ChangeDate_DE" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Pending' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And user waits till loading spinner disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User clicked on 'Add New Source Code' button
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Pending   |
		| Committed |
	Then user asserts "Effective Date","Effective To" for "CloneToNewDate_Pending" records
		| fromDateColumn                                   | effectiveToDateColumn | status    |
		| Enter the Effective Date for the new set of PADs |                       | Pending   |
		| EffectiveFromDate                                |                       | Committed |
	And User closes dialog if still present

	#Change date of pending record
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User scroll to 'Billing Authority Link' element
	And User entered 25 days after date for 'Target Date' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Pending' record
	And User clicked on 'Change Date' button
	And User entered data for 'Enter an Effective From Date' field value on dialog
	And User clicked on 'Continue' button
	And User clicked on 'Add New Source Code' button
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Pending   |
		| Committed |
		| Superseded |
	And User closes dialog if still present
	And User closes browser

@Regression @DataEnhancement @P1_C @E2E @mini_Regression @HP_E2E
Scenario:DE03_CTPRELMGMT-1604E2E Data Enhancement - Full process of Removing a Pending PAD set
	Given User is logged in to Dynamics application to work for "E2E_Pending_Remove_DE" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Pending' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	#And User looked for 'Group' field value only when data not entered
	#And User looked for 'Type' field value only when data not entered
	#And User looked for 'Age Code' field value only when data not entered
	#And User enter data for 'Area' field value
	#And User enter data for 'Rooms' field value
	#And User enter data for 'Bedrooms' field value
	#And User enter data for 'Bathrooms' field value
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
	#And User looked for 'Conservatory Type' field value only when data not entered
	#And User enter data for 'Conservatory Area' field value only when data not entered
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Pending   |
		| Committed |
	And User closes dialog if still present

	##Removing pending record
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User scroll to 'Billing Authority Link' element
	And User entered 25 days after date for 'Target Date' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Pending' record
	And User clicked on 'Remove' button
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User click on 'Refresh' button from 'dialog'
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicked on 'Refresh' button
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Committed |
	And User closes browser

@Regression @DataEnhancement @P1_C @E2E 
#CTPRELMGMT-1604	E2E Data Enhancement - Full process of Ameding a Pending PAD set
#CTPRELMGMT-1630	Data Enhancement - Release and Publish Edits of Pending PAD Set
Scenario:DE04_CTPRELMGMT-1604_CTPRELMGMT-1630_E2E Data Enhancement-Full process of Ameding a Pending PAD set
	Given User is logged in to Dynamics application to work for "E2E_Amend_Pending_DE" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
		And User get PAD attributes of 'Committed' record

	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Pending' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And user waits till loading spinner disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Pending   |
		| Committed |
	Then user asserts "Effective Date","Effective To" for "CloneToNewDate_Pending" records
		| fromDateColumn                                   | effectiveToDateColumn | status    |
		| Enter the Effective Date for the new set of PADs |                       | Pending   |
		| EffectiveFromDate                                |                       | Committed |
	And User closes dialog if still present

	#Amending of pending record
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User scroll to 'Billing Authority Link' element
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User entered 0 days before date for 'Date Received' field value
	And User scroll to 'Billing Authority Link' element
	And User entered 25 days after date for 'Target Date' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Pending' record
	And User get PAD attributes of 'Pending' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
		And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status |
		| Pending    |
		| Committed  |
	And User closes browser

@Regression @DataEnhancement @P1_C @E2E 
#CTPRELMGMT-1634	Data Enhancement - Release and Publish New Committed PAD Set
#CTPRELMGMT-1609	E2E Data Enhancement - Data Enhancement Job created and completed through Release and Publish with Committed PAD set
Scenario: DE05_CTPRELMGMT-1634_Data Enhancement - Release and Publish New Committed PAD Set
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User is logged in to Dynamics application to work for "E2E_NewCommitted_DE" case
	And User collapse if site map navigation expanded on left pane
    Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status    |
		| Committed |
		| Committed |
	Then user asserts "Effective Date","Effective To" for "CloneToNewDate_Committed" records
		| fromDateColumn                                   | effectiveToDateColumn                            | status    |
		| Enter the Effective Date for the new set of PADs |                                                  | Committed |
		| EffectiveFromDate                                | Enter the Effective Date for the new set of PADs | Committed |
	And User closes browser

@Regression @DataEnhancement @P1_A @E2E @HP_E2E
#CTPRELMGMT-1628	Data Enhancement - Release and Publish Changed Date of Committed PAD Set	Completed
#CTPRELMGMT-1605	E2E Data Enhancement - Full process of changing the date of a Committed PAD set	Completed
Scenario:DE06_CTPRELMGMT-1628_CTPRELMGMT-1605_E2E Data Enhancement - Release and Publish Changed Date of Commited PAD Set
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User is logged in to Dynamics application to work for "BST-79158_E2E_DE" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User selects 'Committed' record
		And User get PAD attributes of 'Committed' record
	And User clicked on 'Change Date' button
	And User entered data for 'Enter an Effective From Date' field value on dialog
	And User clicked on 'Continue' button
	And user waits till loading spinner disappears
	#And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	#And User looked for 'Group' field value only when data not entered
	#And User looked for 'Type' field value only when data not entered
	#And User looked for 'Age Code' field value only when data not entered
	#And User enter data for 'Area' field value
	#And User enter data for 'Rooms' field value
	#And User enter data for 'Bedrooms' field value
	#And User enter data for 'Bathrooms' field value
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
	#And User looked for 'Conservatory Type' field value only when data not entered
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
		And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
		| status     |
		| Committed  |
		| Superseded |
	Then user asserts "Effective Date","Effective To" for "Change Date" records
		| fromDateColumn               | effectiveToDateColumn        | status     |
		| Enter an Effective From Date |                              | Committed  |
		| EffectiveFromDate            | Enter an Effective From Date | Superseded |
	And User closes browser

@Regression @DataEnhancement @P1_A @E2E @Inspection
Scenario:DE07_CTPRELMGMT-1622 Data Enhancement-Complete Inspection at Desktop Research stage
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User is logged in to Dynamics application to work for "BST-69601_Inspections" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	Given User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Inspections' tab under 'Desktop Research Form'
	Then User validates the default values for below fields under 'CT Inspection' section
		| fieldName                                | fieldValue                       |
		| Photos                                   | Inspection                       |
		| Location Plan                            | Obtained/Validated by Researcher |
		| Floor Plan (including layout and access) | Obtained/Validated by Researcher |
		| Measurements                             | Obtained/Validated by Researcher |
		| Details of occupation                    | Obtained/Validated by Researcher |
		| Complete HMO checklist                   | Obtained/Validated by Researcher |
		| Complete boat/mooring checklist          | Obtained/Validated by Researcher |
		| Other- see remarks                       | Obtained/Validated by Researcher |
	And User click on 'Is an Inspection Required?' toggle button
	And User clicks on 'Reason for Inspection' dropdown and select 'Check the state of repair' value
	And User enter data for 'Reason For Inspection Comments' text area field value
	#And User entered date for 'Internal Inspection SLA' field value
	#And User entered 5 days before date from calender for 'Internal Inspection SLA' field
	And User entered 5 days before date from calender for 'Internal Inspection SLA' field value on 'dialog'
	And User clicks on 'Inspection Allocation' dropdown and select 'Assign Inspection to Inspector' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates Inspections 'Job ID' with parent job id from 'searchcontext'
	And User clicks on Inspections 'Job ID' element
	And User click on 'Refresh' button from 'dialog'
	#And User click on 'Assign' button from 'dialog'
	#And User clicks on 'Assign' button on 'Assign to Team or User' dialog
	#And user waits till loading spinner disappears
	#And User click on 'Refresh' button from 'dialog'
	And User click on 'Inspection On Site' tab from 'Inspection Task Form'
	And The inspector makes changes to the below default values under 'CT Inspections'
		| fieldName | fieldValue                       |
		| Photos    | Obtained/Validated by Researcher |
	Then User validates and clicks the 'General' tab present in the 'Inspection Task Form' tablist
	And User clicks on 'Inspection Type' dropdown and select 'Full' value
	And User click on 'Inspection On Site' tab from 'Inspection Task Form'
	And User click on 'Save' button from 'dialog'
	And User click on 'Mark Complete' button from 'dialog'
	Then User validates the default values for below fields under 'CT Inspection' section
		| fieldName | fieldValue                       |
		| Photos    | Obtained/Validated by Researcher |
	And User closes browser

@QAQC
Scenario:DE08_CTPRELMGMT-1603 Data Enhancement - QA Pass for Committed PAD Set with alerts
	And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
		| fieldName |
		| uprn      |
	Given User is logged in to Dynamics application to work for "BST_91773_QAREVIEW" case
	And User collapse if site map navigation expanded on left pane
	###MaterialReduction
	Given User click on 'Submissions' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Integration Data Source' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Relationship Role' field value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Related Requests' element
	And User click 'New Request' button
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'MR_001_DE'
	And User entered 0 days before date for 'Date Received' field value
	And User entered date for 'Proposed Effective Date' field value from 'TestDataPart3' for 'MR_001_DE'
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	#And User click on "Job Id" element
	#And User waits till 'Details' stage selected
	##DataEnhancement Job
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days after date for 'Target Date' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Save & Close' button on dialog
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Refresh' button from 'menubar'
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till app progress indicator disappears
	#And User clicked on 'Alerts' tab under 'Job Form'
	#And User clicked on 'New Alert' button
	#And User looked for 'Alert Type' field value
	#And User click on 'Save & Close' button from 'menubar'
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User captures "EffectiveFromDate" for "committed" record in "scenarioContext"
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	#And User looked for 'Group' field value only when data not entered
	#And User looked for 'Type' field value only when data not entered
	#And User looked for first element 'Age Code' field value only when data not entered
	#And User enter data for 'Area' field value
	#And User enter data for 'Rooms' field value
	#And User enter data for 'Bedrooms' field value
	#And User enter data for 'Bathrooms' field value
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
	#And User looked for 'Conservatory Type' field value only when data not entered
	#And User enter data for 'Conservatory Area' field value only when data not entered
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
		And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears

	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'All Jobs Created for Request' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User clicked on 'Quality Review' tab under 'Job Form'
	And User selects review record 
	#And User clicks on 'Edit' button element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User modifies 'Job Owner' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User changes job owner if team is assigned to it
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Approve' button from 'menubar'
	Then user validated 'Approval Accepted! Ensure you save this record to confirm.' text
	And User clicks on 'Ok' button element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User clicked on 'Approvals' tab under 'Review Form'
	And User enter data for 'Approval Decision Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Review Complete' status display
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User closes browser

#@Regression @DataEnhancement @P1_A @E2E 
#Scenario:DE09_CTPRELMGMT-1610 Data Enhancement -  Create Request through Estate Action
#	#NewEstateProperty
#	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
#	#And User connects to the DB and modifies query with 'postcode' and retrieves the unique data for 'NewPropertyQuery'
#	#	| fieldName |
#	#	| uprn      |
#	#	| name      |
#	Given User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
#	And User collapse if site map navigation expanded on left pane
#	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
#	And User click on 'New' button from 'menubar'
#	And User looked for 'Billing Authority' field value
#	And User enter data for 'Development Name' field value
#	And User click on 'Save' button from 'menubar'
#	And user waits for '5' secs
#
#	And User click on 'Launch VMS' button from 'menubar'
#	And User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
#	And user waits for '5' secs
#
#	And User click on 'Estate Actions' tab from 'Estate File Form'
#	And User clicks on 'New Estate Action' button element
#	And User looked for 'Estate Action Type' field value
#	And User enter data for 'Number of Plots' field value
#	And User enter data for 'Plot Starting Number' field value
#	And User click on 'Submit' toggle button
#	And User clicked on 'Save and Close' button on new UI
#	And user waits till 'Saving...' 'progressbar' disappears
#	And user waits for '5' secs
#	And User click on 'House Types' tab from 'Estate File Form'
#	And User clicks on 'New House Type' button element
#	And User enter data for 2 position 'Name' field value
#	And User looked for 2 position 'Group' field value
#	And User looked for 'Type' field value
#	And User looked for 'List' field value
#	And User clicked on 'Save and Close' button on new UI
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on newly created house type
#	And User waits till 'Validate PAD' stage selected
#	And User enter data for 'Area' field value
#	And User enter data for 'Rooms' field value
#	And User enter data for 'Bedrooms' field value
#	And User enter data for 'Bathrooms' field value
#	And User enter data for 'Floors' field value
#	And User looked for 'Parking' field value
#	And User scroll to 'PAD Validation' element
#	And User click on 'Validate PAD Code' toggle button
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validate value 'Pass' for 'PAD Validation Outcome' field
#	And User click on 'Save' button from 'menubar'
#	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
#	And User waits till 'Banding' stage selected
#	And User closes business process stage container
#	And User click on 'Refresh' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Banding' tab under 'House Type Form'
#	And User looked for 'Proposed Tax Band' single character field value
#	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
#	And User waits till 'Approve House Type' stage selected
#	And User click on 'Refresh' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Approvals' tab under 'House Type Form'
#	And User looked for 'Approver' field value
#	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
#	And User enter data for 'Outcome Reason' text area field value
#	And User click on 'Save' button from 'menubar'
#	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
#	And User clicks on 'Go back' button
#	And user waits for '5' secs
#
#	And User click on 'Addresses' tab from 'Estate File Form'
#	And user enters data in "Postcode" and selects unique address for estates in 'featureContext'
#	#And User click on 'Find Address' button
#	
#	And user waits for '5' secs
#	
#	And User click on 'Plot Manager' tab from 'Estate File Form'
#	And User selects Address Labels for 'postcode'
#	And User captures "Estate File" in "scenarioContext" from estate files grid
#	And User click on 'Save & Close' button from 'menubar'
#
#	Given User click on 'Requests' under 'Service' section
#	And User click on 'New' button from 'menubar'
#	And User looked for 'Job Type' field value
#	And User entered 0 days before date for 'Date Received' field value
#	And User entered 25 days before date for 'Proposed Effective Date' field value
#	And User looked for 'Submitted By' field value
#	And User looked for 'Data Source Role' field value
#	And User enter data for 'BA Report Number' field value
#	And User clicks on 'Channel' dropdown and select 'Email' value
#	And User enter data for 'BA Report Number' field value
#	And User scroll to 'Billing Authority Link' element
#	And User enter random number for 'Proposed BA Reference Number' field value
#	#And User looked for 'Estate File' field value from 'scenarioContext'
#	And User looked for 'Estate File' field value from context 'scenarioContext'
#	And User click on Find Plot button
#	And User selects '1' row from search plot results
#	And User clicked on 'Select' button
#	And User waits till Find Hereditament dialog disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	#And User validate 'Validating' status of 'Request'
#	And User clicks on 'Validate Request' under 'Request Action'
#	And User clicks on 'Proceed' button on 'Confirm' dialog
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Related Jobs' tab from 'Request Form'
#	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
#	#Given User click on 'Queues' under 'Service' section
#	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
#	Given User click on 'Jobs' under 'Service' section
#	And User 'Assign' 'Job Name' through 'All Jobs'
#	And User click on "Job Id" element
#	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
#	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
#	And User opens 'Estate File' from 'scenarioContext'
#	And User click on 'Estate Actions' tab from 'Estate File Form'
#	And User clicks on 'New Estate Action' button element
#	And User looked for 'Estate Action Type' field value from 'Estate_TG' for 'Estate_DE_002'
#	And User looked for first element 'Live Hereditament' field value only when data not entered
#	And user waits for '5' secs
#	And User clicked on 'Estate Action Type' label
#	And User click on 'Submit' toggle button
#	And User clicked on 'Estate Action Type' label
#	And User looked for first element 'House Type to Change to' field value only when data not entered
#	And User clicked on 'Save and Close' button on new UI
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validated 'Create Data Enhancement' link is created under 'Estate Actions' by clicking on 'Refresh'
#	And User closes browser

@Regression @DataEnhancement @E2E 
Scenario:DE10_CTPRELMGMT-1429 [SIT] - [BST-152651] - Validate NDA Actions are not removed when the Old PAD's are removed and new PAD's are added
	Given User is logged in to Dynamics application to work for "E2E_proposed_Remove_DE" case
	And User collapse if site map navigation expanded on left pane
And User connects to the DB and retrieves the data for 'findhereditament_DE_new'
	| fieldName |
	| uprn      |
Given User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value
And User entered 0 days before date for 'Date Received' field value
And User entered 25 days after date for 'Target Date' field value
And User enter data for 'Remarks' text area field value
And User click on 'Find Hereditament' button
And User select 'UPRN' value from 'Search By' dropdown
And User enters data in "UPRN" field
And User clicked on 'Search' button
And User slects spcific 'uprn' row from search hereditament results
And User clicked on 'Select' button
And User waits till Find Hereditament dialog disappears
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Validate Request' under 'Request Action'
And User click on 'Save & Close' button from 'dialog'
And User waits till 'dialog' disappears
And User validate 'In Progress' status of 'Request'
And User click on 'Related Jobs' tab from 'Request Form'
And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
And User click on "Job Id" element
And User waits till 'Details' stage selected
#And User click on 'Refresh' button from 'menubar'
#And User 'Assign' job to self on 'Assign to Team or User' pop-up
#And user waits till loading spinner disappears
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User selects 'Committed' record
And User get PAD attributes of 'Committed' record
And User captures "EffectiveFromDate" for "Committed" record in "scenarioContext"
And User clicked on 'Clone to New Date' button
And User clicked on 'Pending' button
And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
And User clicked on 'Continue' button
And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
And User enter Property Attributes
And User enter data for 'Floors' field value only when data not entered
And User enter data for 'Level' field value only when data not entered
And User looked for 'Conservatory Type' field value only when data not entered
And User enter data for 'Conservatory Area' field value only when data not entered
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Add New Source Code' button
And User looked for 'Source Code' field value
And User enter data for 'Comment' field value
And User click on 'Save & Close' button from 'menubar'
And User scroll to 'PAD Validation' element
And User click on 'Validate PAD Code' toggle button
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validate value 'Pass' for 'PAD Validation Outcome' field
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
And User scroll to 'PAD Validation' element
And User clicks on 'Reset PAD Validation?' dropdown and select 'Yes' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User selects 'Proposed' record
And User get PAD attributes of 'Proposed' record
And User clicked on 'Remove' button
And User clicks on 'OK' button on 'Confirm' dialog
And user waits till app progress indicator disappears
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User selects 'Committed' record row
And User get PAD attributes of 'Committed' record
And User captures "EffectiveFromDate" for "Committed" record in "scenarioContext"
And User clicked on 'Clone to New Date' button
And User clicked on 'Pending' button
And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
And User clicked on 'Continue' button
And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
And User enter Property Attributes
#And User enter data for 'Floors' field value only when data not entered
And User enter data for 'Level' field value only when data not entered
And User looked for 'Conservatory Type' field value only when data not entered
And User enter data for 'Conservatory Area' field value only when data not entered
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Add New Source Code' button
And User looked for 'Source Code' field value
And User enter data for 'Comment' field value
And User click on 'Save & Close' button from 'menubar'
And User scroll to 'PAD Validation' element
And User click on 'Validate PAD Code' toggle button
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validate value 'Pass' for 'PAD Validation Outcome' field
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Yes' button on 'Complete Job' dialog
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on job link in Header
And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
And User clicked on 'Details' tab under 'Job Form'
And User click on 'Request' link
And User clicks on 'Release and Publish' under 'Request Action'
And User clicks on 'OK' button element
And User closes dialog if still present
And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
And User clicked on 'Details' tab under 'Job Form'
And User scroll to 'Hereditament Details' element
And User click on 'Hereditament' link
And User clicked on 'PVT' tab under 'Hereditament Form'
And User clicks on 'Refresh' button on hereditament dialog and asserts 'status' records
	| status    |
	| Pending   |
	| Committed |
And User closes dialog if still present
And User closes browser

	
	

	
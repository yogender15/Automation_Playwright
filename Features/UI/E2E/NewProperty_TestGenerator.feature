@UI
Feature: NewProperty test data genarator

@TestDataGenerator
Scenario:NP_TD01_NewProperty Creation
	#NewProperty
	Given I run the scenario <Iterations> times
	Given User uses test data with ID 'NP_003' from 'TestDataPart3' sheet
	#Given User is logged in
	Given User is logged in to Dynamics application to work for "NewProp_TD_Generator" case
	Given User click on 'Submissions' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Integration Data Source' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Relationship Role' field value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Related Requests' element
	And User click 'New Request' button
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	#And User scroll to 'Planning Details' element
	#And User enter data for 'Reason for Portal Reference Omission' field value
	And User enter data for 'Reason For Validation' field value
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User validate 'Validating' status of 'Request'
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	#And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	#And User clicks on 'Submit Job' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	#And User validate 'Researching' status of 'Job'
	And User waits till 'Details' stage selected
	And User click on 'Refresh' button from 'menubar'
	And User 'Assign' job to self on 'Assign to Team or User' pop-up
	And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User looked for 'Group' field value
	#And User looked for 'Type' field value
	#And User looked for 'Age Code' field value
	And User looked for first element 'Group' field value only when data not entered
	And User looked for first element 'Type' field value only when data not entered
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for 'Parking' field value
	And User looked for 'Conservatory Type' field value only when data not entered
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
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User clicked on 'Undertake Banding' BPF Journey button
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	#And User enter data for 'Caseworker Conclusions / Remarks / Thought Process' text area field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	#And User selects 'Yes' value for 'Is Banding Complete?' dropdown field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And user waits till app progress indicator disappears
	And User switchs to Assessment frame
	And user waits till app progress indicator disappears
	And User clicked on 'Proposed Assessments' button
	Then user asserts 'Proposed Assessments' row count '1'
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	#And User selects 'No' value for 'Correspondence Checks Complete?' dropdown field
	#And User selects 'Yes' value for 'Maintain Assessment Complete?' dropdown field
	And User clicks on 'Yes' button on 'All Jobs Created for Request' dialog
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User captures 'Address String' input field in 'scenarioContext'
	And User captures 'Job ID' input field in 'scenarioContext'
	And User captures the 'Job ID','Address String' data in the 'NewPropOutPutData' output sheet
	And User closes browser

	Examples:
		| Iterations |
		| 1          |
		| 2          |

#| 3          |
#| 4          |
#| 5          |
#| 6          |
#| 7          |
#| 8          |
#| 9          |
#| 10         |
@TestDataGenerator
Scenario: NP_TD02_Band_NewProperty Creation with Modified Band Values
	#NewProperty
	Given I run the scenario <Iterations> times
	Given User uses test data with ID 'NP_003' from 'TestDataPart3' sheet
	Given User is logged in
	Given User click on 'Submissions' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Integration Data Source' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Relationship Role' field value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Related Requests' element
	And User click 'New Request' button
	#And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User entered date for 'Proposed Effective Date' field value
	And User click on 'Find Address' button
	And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in <Postcode> and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	#And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User waits till ProgressRing disappears
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason for Portal Reference Omission' field value
	And User enter data for 'Reason For Validation' field value
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	#And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Submit Job' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till 'dialog' disappears
	Then User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	Then User validate 'Researching' status of 'Job'
	And User waits till 'Details' stage selected
	And User click on 'Refresh' button from 'menubar'
	And User 'Assign' job to self on 'Assign to Team or User' pop-up
	And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	#And User validate below business stages on business journey header
	#	| BusinessStages      |
	#	| Details             |
	#	| Researching         |
	#	| Undertake Banding   |
	#	| Maintain Assessment |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	#And User waits till ProgressRing disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User looked for first element 'Group' field value only when data not entered
	And User looked for first element 'Type' field value only when data not entered
	And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for 'Parking' field value
	And User looked for 'Conservatory Type' field value only when data not entered
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
	And User waits till 'Undertake Banding' stage selected
	And User clicked on 'Undertake Banding' BPF Journey button
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	#And User looked for 'Proposed Tax Band' single character field value
	And User looked for 'Proposed Tax Band' <bandValue> single character field value
	And User selects 'Yes' value for 'Is Banding Complete?' dropdown field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And user waits for '1' secs
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	#And user waits for '1' secs
	And User switchs to Assessment frame
	#And user waits for '1' secs
	And User clicked on 'Proposed Assessments' button
	Then user asserts 'Proposed Assessments' row count '1'
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User selects 'No' value for 'Correspondence Checks Complete?' dropdown field
	And User selects 'Yes' value for 'Maintain Assessment Complete?' dropdown field
	And User clicks on 'Yes' button on 'All Jobs Created for Request' dialog
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User captures 'Address String' input field in 'scenarioContext'
	And User captures 'Job ID' input field in 'scenarioContext'
	And User captures the 'Job ID','Address String' data in the 'NewPropOutPutData' output sheet

	Examples:
		| Iterations | bandValue | Postcode |
		| 1          | A         | B13 0TB  |
		| 2          | B         | B13 0TB  |
		| 3          | A         | CF11 7AR |
		| 4          | B         | CF11 7AR |
		| 5          | B         | CF11 7AR |

@TestDataGenerator
Scenario: NE_TD03_New Esatate Creation
	#NewEstateProperty
	Given I run the scenario <Iterations> times
	Given User uses test data with ID 'Estate_TD_001' from 'Estate_TG' sheet
	Given User is logged in to Dynamics application to work for "NewEstate_TD_Generator" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears
	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in <postcode> and selects all address for estates
	#And user enters data in <postcode> and selects <numberOfPlots> unique address for estates in 'scenarioContext'
	And user waits till app progress indicator disappears
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value with value <numberOfPlots>
	And User enter data for 'Plot Starting Number' field value
	And User click on 'Submit' toggle button
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User click on 'House Types' tab from 'Estate File Form'
	And User clicks on 'New House Type' button element
	And User enter data for 2 position 'Name' field value
	And User looked for 2 position 'Group' field value
	And User looked for 'Type' field value
	And User looked for 'List' field value
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on newly created house type
	And User waits till 'Validate PAD' stage selected
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User looked for 'Parking' field value
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User clicked on 'Banding' tab under 'House Type Form'
		And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User select Address Labels with iteration for <position>,<postcode>
	And User click on 'Save & Close' button from 'menubar'
	And User closes browser

	Examples:
		| Iterations | bandValue | plotsize | numberOfPlots | pageNum | postcode | position |
		#| 1          | C         | 180      | 100           | 1       | CF5 5PE  | 1        |
		| 1          | C         | 180      | 100           | 1       | CF14 3UX  | 1        |


@TestDataGenerator
Scenario: CBARef_TD04_Change of BA reference Auto Process
	#Change Of BA Ref Test Data
	Given I run the scenario <Iterations> times
	Given User uses test data with ID 'BAR_001' from 'TestDataPart3' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	Given User is logged in to Dynamics application to work for "BAref_TD_Generator" case
	Given User click on 'Submissions' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Integration Data Source' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Relationship Role' field value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Related Requests' element
	And User click 'New Request' button
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'Billing Authority Link' section and enter data in 'Proposed BA Reference Number' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till 'dialog' disappears
	And User click on 'BA Reference' tab from 'Request Form'
	And user waits till app progress indicator disappears
	And User clicks on 'New Proposed BA Reference Amendment' button element
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate For Autoprocess' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User captures 'Address String' input field in 'scenarioContext'
	And User captures 'Job ID' input field in 'scenarioContext'
	And User captures the 'Job ID','Address String' data in the 'NewPropOutPutData' output sheet
	And User closes browser

	Examples:
		| Iterations |
		| 1          |


@TestDataGenerator
Scenario: MR_TD05_Material Reduction request and Job Test Data Genarator
	Given I run the scenario <Iterations> times
	Given User uses test data with ID 'MR_001' from 'TestDataPart3' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	Given User is logged in to Dynamics application to work for "BST-80539_CR07" case
	Given User click on 'Submissions' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Integration Data Source' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Relationship Role' field value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Related Requests' element
	And User click 'New Request' button
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User 'Assign' job to self on 'Assign to Team or User' pop-up
	And user waits till loading spinner disappears
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User captures 'Address String' input field in 'scenarioContext'
	And User captures 'Job ID' input field in 'scenarioContext'
	And User captures the 'Job ID','Address String' data in the 'NewPropOutPutData' output sheet
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User closes browser

	Examples:
		| Iterations |
		| 1          |
		| 2          |
		| 3          |
		| 4          |
		| 5          |
		| 6          |
		| 7          |
		| 8          |
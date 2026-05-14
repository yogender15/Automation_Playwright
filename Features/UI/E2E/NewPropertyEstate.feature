@UI
Feature: E2E New Property Estate BP

@E2E @New_Estate @Regression @P1_B @mini_Regression @HP_E2E
#CTPRELMGMT-1526 - SIT - [BST-138528] [INC3282734]- Validate Correspondence Address in the Request and job matches
#CTPRELMGMT-1541 - SIT - [BST-134053] [INC3222550] - Set Correspondence Address on Request
#CTPRELMGMT-1617 -[SIT] - E2E - CT New Estates - Verify the CR03 Estate Job for an estate file with all approved housetype, plots allocated address can be auto-processed
#CTPRELMGMT-1623 - [SIT] Test CT - New Estate - Estate File - House Type Banding
#CTPRELMGMT-1626 - [SIT] Test CT - New Estates - Create Plots in an Estate File
#CTPRELMGMT-1638 - [SIT] Test - CT New Estate - Verify Estate file Approver can approve the House type
#CTPRELMGMT-1625 - [SIT] Test CT - New Estates - Create House Type in an Estate File
#CTPRELMGMT-1627 - [SIT] Test CT New Estates- House Type PAD Management can Enter enter valid details of PAD Code data, process PAD validation and are submitted for banding
Scenario: 10. New Property Estate E2E - Auto Processing
	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
	#And User connects to the DB and modifies query with 'postcode' and retrieves the unique data for 'NewPropertyQuery'
	#	| fieldName |
	#	| uprn      |
	#	| name      |
	And Login to Dynamics application with 'VOA Team Manager' user to work for "NewEstate_E2E_AutoProcess" case
	#And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type

	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'

	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'featureContext'
	And user waits till app progress indicator disappears
	
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User looked for 'Estate File' field value from 'scenarioContext'
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Billing Authority Link' label
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Use Service Address' dropdown and select 'Yes' value
	And User click on 'Find Service Address' button
	#And user enters data in "postcode" and for corresponce address
	And User enters data in "postcode" field for new property find address
	And User clicked on 2 position 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results for find service address
	And User slects spcific 'uprn' row from search hereditament results for new property
	And User clicked on 'Use Address' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'OK' button element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And user waits till progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'Status Reason' dropdown and select 'Ready' value
	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	And User selected 'Integration Messages' under 'Related' tab
	And User click on messages "Job Id" element
	And User captures 'Message' text area field in 'featureContext'
	Then User validates 'Quadient Message' contains 'Address' feature context data
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'Active' after Plot has been Auto Processed
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value from 'Estate_TG' for 'Estate_DE_002'
	And User looked for first element 'Live Hereditament' field value only when data not entered
	And user waits till app progress indicator disappears
	And User clicked on 'Estate Action Type' label
	And User click on 'Submit' toggle button
	And User clicked on 'Estate Action Type' label
	And User looked for first element 'House Type to Change to' field value only when data not entered
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validated 'Create Data Enhancement' link is created under 'Estate Actions' by clicking on 'Refresh'
	And User closes browser

@E2E @New_Estate @Regression @P1_B
#CTPRELMGMT-1619 - [SIT] Test - CT New Estate - Verify Estate file Approver can reject the House type
#CTPRELMGMT-1550 - [SIT] - [BST-132787] - Verify that  when House Type was rejected field values should be retained, reverting back to banding stage 
#CTPRELMGMT-1543- [SIT] - [BST-137746] - Validate the view for Rejected House Type Approvals
#CTPRELMGMT-1587 - [SIT] [BST-132782] - Standard User - Create and populate House Type Approval History Table 
Scenario: 11. Approver can Reject the House Type
	Given User uses test data with ID 'Estate_DE_003' from 'Estate_TG' sheet
	And Login to Dynamics application with 'VOA Team Manager' user to work for "NewEstate_E2E_Rejection" case
	#And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till 'Saving...' 'progressbar' disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
	And User enter data for 'Plot Starting Number' field value
	And User click on 'Submit' toggle button
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'House Types' tab from 'Estate File Form'
	And User clicks on 'New House Type' button element
	#And User enter data for 2 position 'Name' field value
	And User enter data for 2 position 'Name' field with custom value
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User clicked on 'Approvals' tab under 'House Type Form'
	Then User validates the Approval history notification
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'No' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User waits till 'Banding' stage selected
	Then User validates the Approval history notification for 'Reject' HouseType
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user
	And User click on 'Dashboards' under 'My Work' section
	And User click on 'Customer Enquiry Dashboard' under 'My Team Estate File Dashboard' dropdown
	And User scroll to 'All House Type Rejected Approvals' section
	Then User validates All House Type Rejected Approvals notification
	And User click on 'Dashboards' under 'My Work' section
	And User click on 'Customer Enquiry Dashboard' under 'My Estate File Dashboard' dropdown
	And User scroll to 'My House Type Rejected Approvals' section
	Then User validates All House Type Rejected Approvals notification
	And User closes browser


@E2E @New_Estate @Regression @P1_B
#CTPRELMGMT-1616 - [SIT] - E2E - CT New Estates - Verify the New property estate file Job can auto-process when the house type changes from 'Awaiting approval' to approved
#CTPRELMGMT-1683-[SIT] - [BST-126058] - Restart Processing button resumes processing of Incomplete Plots
#CTPRELMGMT-1501 -[SIT] - [BST-137792] Validate status is changed from Unbanded to Approved for New Estate
#CTPRELMGMT-1540 - SIT - [BST-134053] [INC3222550]- Set Correspondence Address on Job
Scenario: 12. Verify the New property estate file Job can auto-process when the house type changes from 'Awaiting approval' to approved
	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
	And Login to Dynamics application with 'VOA Team Manager' user to work for "NewEsate_AwaitingApproval" case
	#And User is logged in to Dynamics application to work for "NewEsate_AwaitingApproval" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	And user waits till app progress indicator disappears
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears

	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'scenarioContext'
	And user waits till app progress indicator disappears


	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Billing Authority Link' label
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Researching' status display
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Use Service Address' dropdown and select 'Yes' value
	And User click on 'Find Service Address' button
	#And user enters data in "postcode" and for corresponce address
	And User enters data in "postcode" field for new property find address
	And User clicked on 2 position 'Search' button
	And User slects spcific 'uprn' row from search hereditament results for new property
	And User clicked on 'Use Address' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'OK' button element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User waits till 'Approve House Type' stage selected
	And User clicked on 'Approve House Type' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Plot Manager' tab from 'Estate File Form'
	Then User validates the Plot status as 'INCOMPLETE' after Plot has been Auto Processed
	
	And User select 'INCOMPLETE' plot
	And User clicked 'Restart Processing' button contains name on 'Plot Manager' section
	
	And User click on 'Jobs' under 'Service' section
	And User filters 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	
	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'Status Reason' dropdown and select 'Ready' value
	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	And User selected 'Integration Messages' under 'Related' tab
	And User click on messages "Job Id" element
	And User captures 'Message' text area field in 'featureContext'
	#And User validates 'Quadient Message' contains 'Address' feature context data

	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'Active' after Plot has been Auto Processed
	And User closes browser

@E2E @New_Estate @Regression @P1_B
#CTPRELMGMT-1615 -  [SIT] - E2E - CT New Estates - Verify the system re-runs auto process rules to check CR03 Jobs now qualify for auto processing after the block on an estate file is removed
Scenario: 13. Verify the New property estate file Job auto-processes after Unblock of Estate File
	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
	And Login to Dynamics application with 'VOA Team Manager' user to work for "NE_E2E_Block_UnBlock" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid


	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type

	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'


	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'scenarioContext'
	And user waits till app progress indicator disappears

	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value from 'Estate_TG' for 'Estate_DE_005'
	And User enter data for 'Reason for Blocking' field value
	And User click on 'Submit' toggle button
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User click on 'Refresh' button from 'menubar' untill 'Blocked' status display
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	#And User looked for 'Estate File' field value from 'scenarioContext'
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Billing Authority Link' label
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Refresh' button from 'menubar' untill 'Blocked' status display
	And User fetch 'Request Name' in 'featureContext'
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate File Reviews' tab from 'Estate File Form'
	And User clicks on 'Unblock Estate File?' dropdown and select 'Yes' value
	#And User enter data for 'Review Outcome Reason' field value
	And User enter data for 'Unblock Estate File Reason' text area field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Active' status display
	And User click on 'Addresses' tab from 'Estate File Form'
	And user waits till app progress indicator disappears
	And User clicks on request link under address tab
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'Active' after Plot has been Auto Processed
	And User closes browser

@ignore
Scenario: 14.BST-87271[SIT] - E2E - CT New Estates - Verify the Incorrect Individual Property request/Job can be converted or alternate New Property Estate job can be raised
	Given User uses test data with ID 'Estate_DE_011' from 'Estate_TG' sheet
	And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears
	
	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears

	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears

	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'scenarioContext'
	And user waits till app progress indicator disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid

	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'NewProperty' for 'NP_003'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Billing Authority Link' element
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	And User enters data for new property "Postcode" field
	And User clicked on 2 position 'Search' button
	And User slects spcific new property 'uprn' row from search hereditament results
	#And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Billing Authority Link' label
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Details' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display

	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	#And User looked for 'Estate File' field value from 'scenarioContext'
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'Active' after Plot has been Auto Processed
	And User closes browser

@E2E @New_Estate @Regression @P2
# CTPRELMGMT-1585 - [SIT] - [BST-132788] - Re-Reject House Type Approval
Scenario: 15 Re-Reject House Type Approval
	Given User uses test data with ID 'Estate_DE_003' from 'Estate_TG' sheet
	And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears


	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User clicked on 'Approvals' tab under 'House Type Form'
	Then User validates the Approval history notification
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'No' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And User clicked on 'Banding' tab under 'House Type Form'
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
	Then User validates the Approval history notification
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'No' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And User closes browser

@E2E @New_Estate @Regression @P1_B
#CTPRELMGMT-1584 - [SIT] - [BST-133990] CT 'New Property - Estate' -Validate the 'Views' on Estate File for Blocked Requests and Blocked Jobs
Scenario: 16.AC1 Validate the 'Views' on Estate File for Blocked Requests
	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
	And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears

	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'featureContext'
	#And User click on 'Find Address' button
	
	And user waits till app progress indicator disappears
	
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User looked for 'Estate File' field value from 'scenarioContext'
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Use Service Address' dropdown and select 'Yes' value
	And User click on 'Find Service Address' button
	#And user enters data in "postcode" and for corresponce address
	And User enters data in "postcode" field for new property find address
	And User clicked on 2 position 'Search' button
	And User slects spcific 'uprn' row from search hereditament results for new property
	And User clicked on 'Use Address' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'OK' button element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till app progress indicator disappears
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value from 'Estate_TG' for 'Estate_DE_014'
	And User enter data for 'Reason for Blocking' field value
	And User click on 'Submit' toggle button
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User click on 'Refresh' button from 'menubar' untill 'Blocked' status display
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Request' tab from 'Estate File Form'
	And user waits till app progress indicator disappears

Scenario: 17.  AC2 Validate the 'Views' on Estate File for Blocked Jobs
	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
	#And User connects to the DB and modifies query with 'postcode' and retrieves the unique data for 'NewPropertyQuery'
	#	| fieldName |
	#	| uprn      |
	#	| name      |
	And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
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

	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'featureContext'
	#And User click on 'Find Address' button
	
	And user waits till app progress indicator disappears
	
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User looked for 'Estate File' field value from 'scenarioContext'
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Use Service Address' dropdown and select 'Yes' value
	And User click on 'Find Service Address' button
	#And user enters data in "postcode" and for corresponce address
	And User enters data in "postcode" field for new property find address
	And User clicked on 2 position 'Search' button
	And User slects spcific 'uprn' row from search hereditament results for new property
	And User clicked on 'Use Address' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'OK' button element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till app progress indicator disappears
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value from 'Estate_TG' for 'Estate_DE_014'
	And User enter data for 'Reason for Blocking' field value
	And User click on 'Submit' toggle button
	And User clicked on 'Save and Close' button on new UI
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User click on 'Refresh' button from 'menubar' untill 'Blocked' status display
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	And User click on 'Jobs' tab from 'Estate File Form'
	And user waits till app progress indicator disappears


	@E2E @New_Estate @Regression @P1 @NoAction
	#covers Test BST-144059	[SIT] - [BST-140545] - Convert to plot button using Reset function in New Estate
	#BST-148095	[SIT] - [BST-140545] - Convert to plot button using Reset function in New Estate-Confirmation Message
	#BST-148100	[SIT] - [BST-140545] - Convert to plot button using Reset function in New Estate-Form notification message
	#BST-152774 [SIT] - [BST-152045] - INC3456907 - Reset Plot Fails to Re-trigger Request Validation and Auto-Processing in New Estate
	#covered CTPRELMGMT-1523 [BST-138036] - Validate No Action Request if in status of 'Holding'
	Scenario: 18. [SIT] - [BST-139355] - INC3295697 - Verify a user can un-validate and then No Action a New Estate Request[SIT] - [BST-139355] - INC3295697 - Verify a user can un-validate and then No Action a New Estate Request
	Given User uses test data with ID 'Estate_DE_023' from 'Estate_TG' sheet
	And Login to Dynamics application with 'VOA Team Manager' user to work for "BST-139355_No Action" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	And user waits till app progress indicator disappears
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid
	
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User looked for 'Proposed Tax Band' A single character field value
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears

	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
		
	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'scenarioContext'
	And user waits till app progress indicator disappears
	
	And User click on 'Plot Manager' tab from 'Estate File Form'
	And User selects Address Labels for 'postcode'
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'

	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Parent_MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	#And User waits till ProgressRing disappears
	And user waits till progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	
	Given User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'INCOMPLETE' after Plot has been Auto Processed
	And User select 'INCOMPLETE' plot
	And User click on 'resetPlot' button for an incomplete plot
	And User clicked on the 'Confirm' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	

	Given User uses test data with ID 'Estate_DE_022' from 'Estate_TG' sheet
	Given User click on 'Requests' under 'Service' section
	And User opens 'Parent_MR_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
	Then User verifies 'This Request has been reverted to Validating status as Plot was reset. Please verify and validate the Request.' Banner message
	And User modified value 'New Property - Individual' in 'Job Type' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Request Action'
    And User looked for value 'Created in error' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till progress indicator disappears
	And User clicks on 'OK' button on 'Submit No Action' dialog
	#And User closes dialog if still present
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display

	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User enter data for 'BA Report Number' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User scroll to 'Billing Authority Link' element
	#And User enter random number for 'Proposed BA Reference Number' field value
	And User looked for 'Estate File' field value from context 'scenarioContext'
	And User click on Find Plot button
	And User selects '1' row from search plot results
	And User clicked on 'Select' button
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Parent_MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Researching' status display
	
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type
	And User waits till 'Approve House Type' stage selected
	And User clicked on 'Approve House Type' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	Then User validates the Plot status as 'INCOMPLETE' after Plot has been Auto Processed
	
	And User select 'INCOMPLETE' plot
	And User clicked 'Restart Processing' button contains name on 'Plot Manager' section
	
	Given User click on 'Jobs' under 'Service' section
	And User filters 'Job Name' through 'All Jobs'
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

	@E2E @New_Estate @Regression @P1 @NoAction
	Scenario: NPE10. New Property Estate E2E - Auto Processing
	Given User uses test data with ID 'Estate_DE_014' from 'Estate_TG' sheet
	#And User connects to the DB and modifies query with 'postcode' and retrieves the unique data for 'NewPropertyQuery'
	#	| fieldName |
	#	| uprn      |
	#	| name      |
	And Login to Dynamics application with 'VOA Team Manager' user to work for "NewEstate_E2E_AutoProcess" case
	#And User is logged in to Dynamics application to work for "NewEstate_E2E_AutoProcess" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Billing Authority' field value
	And User enter data for 'Development Name' field value
	And User click on 'Save' button from 'menubar'
	And user waits till app progress indicator disappears

	And User click on 'Launch VMS' button from 'menubar'
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' and create estate extent for estate file
	And user waits till app progress indicator disappears
	And User captures "Estate File" in "scenarioContext" from estate files grid

	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User clicks on 'New Estate Action' button element
	And User looked for 'Estate Action Type' field value
	And User enter data for 'Number of Plots' field value
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And User clicked on 'Next Stage' for 'Validate PAD' journey on the headerbar
	And User waits till 'Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'House Type Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Approve House Type' stage selected
	And User waits till 'Approve House Type' stage selected
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA New Estate Approver' user
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'
	And User click on 'Estate Actions' tab from 'Estate File Form'
	And User click on 'House Types' tab from 'Estate File Form'
	And User click on newly created house type

	And User clicked on 'Approvals' tab under 'House Type Form'
	And User looked for 'Approver' field value
	And User clicks on 'House Type Approved?' dropdown and select 'Yes' value
	And User enter data for 'Outcome Reason' text area field value
	And User click on 'Save' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'Approved' status display
	And User clicks on 'Go back' button
	And user waits till app progress indicator disappears
	And User logged out from Dynamics application
	And Login to Dynamics application with 'VOA Team Manager' user
	And User collapse if site map navigation expanded on left pane
	And User click on 'Estate Files' under 'Navigate Dynamics 365' section
	And User opens 'Estate File' from 'scenarioContext'

	And User click on 'Addresses' tab from 'Estate File Form'
	And user enters data in "Postcode" and selects unique address for estates in 'featureContext'
	And user waits till app progress indicator disappears
	
	And User click on 'Plot Manager' tab from 'Estate File Form'
	#And User selects Address Labels for 'postcode'
	And User selects Address Labels for 'postcode' without house type
	And User captures "Estate File" in "scenarioContext" from estate files grid
	And User click on 'Save & Close' button from 'menubar'
	#And User click on 'Requests' under 'Service' section
	#And User click on 'New' button from 'menubar'
	#And User looked for 'Job Type' field value
	#And User entered 0 days before date for 'Date Received' field value
	#And User entered 25 days before date for 'Proposed Effective Date' field value
	#And User looked for 'Submitted By' field value
	#And User looked for 'Data Source Role' field value
	#And User enter data for 'BA Report Number' field value
	#And User clicks on 'Channel' dropdown and select 'Email' value
	#And User enter data for 'BA Report Number' field value
	#And User scroll to 'Billing Authority Link' element
	##And User looked for 'Estate File' field value from 'scenarioContext'
	#And User looked for 'Estate File' field value from context 'scenarioContext'
	#And User click on Find Plot button
	#And User selects '1' row from search plot results
	#And User clicked on 'Select' button
	#And User waits till Find Hereditament dialog disappears
	#And User scroll to 'Billing Authority Link' element
	#And User enter random number for 'Proposed BA Reference Number' field value
	#And User click on 'Billing Authority Link' label
	#And user waits till progress indicator disappears
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'Use Service Address' dropdown and select 'Yes' value
	#And User click on 'Find Service Address' button
	##And user enters data in "postcode" and for corresponce address
	#And User enters data in "postcode" field for new property find address
	#And User clicked on 2 position 'Search' button
	##And User slects spcific 'uprn' row from search hereditament results for find service address
	#And User slects spcific 'uprn' row from search hereditament results for new property
	#And User clicked on 'Use Address' button
	#And User waits till Find Hereditament dialog disappears
	#And User clicks on 'OK' button element
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'Validate Request' under 'Request Action'
	#And User clicks on 'Proceed' button on 'Confirm' dialog
	#And user waits till progress indicator disappears
	#And User click on 'Related Jobs' tab from 'Request Form'
	#And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	##Given User click on 'Queues' under 'Service' section
	##And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	#And User click on 'Jobs' under 'Service' section
	#And User 'Assign' 'Job Name' through 'All Jobs'
	#And User click on "Job Id" element


	
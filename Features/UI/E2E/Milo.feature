@UI
Feature: Milo


@Milo @E2E @P1_C @Regression @mini_Regression
#Covers CTPRELMGMT-1430
Scenario: MILO01_CTPRELMGMT-1417_CTPRELMGMT-1430-[SIT]-[BST-149659]-Verify a hereditament can be linked to and unlinked from a MILO Transaction in Dynamics
Given User uses test data with ID 'Milo_001' from 'TestDataPart3' sheet
And User connects to the DB and retrieves the data for 'FindHereditamentforEnglishHereditament_birmingham'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	Given User is logged in to Dynamics application to work for "Milo_process_Linking" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'MILO Transactions' under 'Search Tools' section
	And User clicks 'Active MILO Transactions' dropdown and filters 'UnLinked MILO Transactions'
	And User captures the 'Name' in 'scenariocontext'
	And User click on 'Link Hereditament' on the menubar
	#And User enters data in "Town/City" field
	#And User enters data in "Postcode" field
	#And User clicked on the 'Search' button 
	#And User slects spcific 'uprn' row from search hereditament results
	#And User select specific 'uprn' row from search hereditament results and save in 'scenarioContext'
	#And User clicked on 'Select' button
	#And user waits for '5' secs
	#And User click on 'Find Hereditament' button
	#And User select 'UPRN' value from 'Search By' dropdown
	And User select 'UPRN' value from 'Search By' dropdown for milo
	And User enters data in "UPRN" field
	#And User clicked on 'Search' button
	And User clicked on 2 position 'Search' button
	And User select specific 'uprn' row from search hereditament results and save in 'scenarioContext'
	And User clicked on 'Select' button
	And user waits till app progress indicator disappears
	And User clicks on 'Close' button on 'Success' dialog
	And User filters the 'Name' through 'Linked MILO Transactions'
	#And User captures the 'Name' in 'scenariocontext'
	And User click on Hereditament link
	And User clicked on 'PVT' tab under 'Hereditament Form'
	And User click on 'MILO Transactions' tab
	#And User validate 'Name' of the milorecord and click on 'unlink' transaction
	Then User validate milorecord and click on 'UnLink' transaction
	And User closes browser

@Milo @E2E @P1_C @Regression @mini_Regression
Scenario:MILO02_CTPRELMGMT-1431-[SIT]-[SIT] [BST-149749] - Validate user can soft delete & un-delete the Milo record
Given User is logged in to Dynamics application to work for "Milo_process_soft delete & un-delete" case
And User collapse if site map navigation expanded on left pane
Given User click on 'MILO Transactions' under 'Search Tools' section
And User clicks 'Active MILO Transactions' dropdown and filters 'Inactive MILO Transactions'
And User captures the 'Name' in 'scenariocontext'
And User click on 'Activate' on the menubar
And User clicks on 'Activate' button on 'Confirm MILO Transaction Activation' dialog
And user waits till app progress indicator disappears
And User clicks on the  'Inactive MILO Transactions' dropdown and filters 'Active MILO Transactions'
And User filters the 'Name' through 'Active MILO Transactions'
Given User click on 'MILO Transactions' under 'Search Tools' section
And User clicks 'Active MILO Transactions' dropdown and filters 'Linked MILO Transactions'
And User captures the 'Name' in 'scenariocontext'
And User click on 'Deactivate' on the menubar
And User clicks on 'Deactivate' button on 'Confirm Deactivation' dialog
And User clicks on the  'Linked MILO Transactions' dropdown and filters 'Inactive MILO Transactions'
And User filters the 'Name' through 'Active MILO Transactions'
And User closes browser
	



	
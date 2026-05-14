@UI
Feature: ChangeOfBAReference


@ChangeofBAReference @E2E @P1_A @Regression @mini_Regression @HP_E2E
#Covers -CTPRELMGMT-1450 [SIT] - [BST-138258] Change of BA Ref - Validate only "Change Proposed effective date" is visible on unlock stage
#Covers -CTPRELMGMT-1437 -[SIT] -[BST-149686] Change of BA Reference - Validate if the Proposed BA Reference Amendment Effective To Date must be the same as: Request Proposed Effective Date 
Scenario: BAREF01_CTPRELMGMT-1673_CTPRELMGMT-1437_CTPRELMGMT-1450_BAref_Change of BA reference Manual Process -Current Date
	Given User uses test data with ID 'BAR_003' from 'BAref' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Rugby_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	Given User is logged in to Dynamics application to work for "E2E_Manual process BA reference" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '0' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'No' value
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'BA Reference' tab from 'Request Form'
	And User click on 'New Proposed BA Reference' button
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User click on 'Unlock Stage' button from 'menubar'
	And User selects 'Change Proposed Effective Date' from 'unlockjobstage' this dropdown and validate value
	And User clicked on 'Confirm' button
	And user waits till 'Unlock Stage is in progress' icon disappears
	And user waits for '30' secs
	And User waits till 'Researching' stage selected
	And User clicked on 'BA Reference' tab under 'Desktop Research Form'

	And User clicks on 'Validate for Release' dropdown and select 'Yes' value
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
	And User selects the 'Billing Authority Links' from the 'Related' tab from 'Hereditament Form'
	Then User asserts below 'Billing Authority Links' details and validate effetive to date
		| Billing_Authority | BA_Reference                 | Effective_From          | Effective_To            | Status     |
		| Submitted By      | Proposed BA Reference Number | Proposed Effective Date |                         | Committed  |
		| Submitted By      | ba_reference                 | effective_from_date     | Proposed Effective Date | Superseded |
	And User closes browser

@ChangeofBAReference @E2E @P1_A @Regression
Scenario:  BAREF02_CTPRELMGMT-1670_BAref_Change of BA reference Auto Process  Current
	Given User uses test data with ID 'BAR_003' from 'BAref' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Rugby_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	Given User is logged in to Dynamics application to work for "E2E_Auto process BA reference" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '0' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'BA Reference' tab from 'Request Form'
	And User click on 'New Proposed BA Reference Amendment' button
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate For Autoprocess' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	#Commented
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User selects the 'Billing Authority Links' from the 'Related' tab from 'Hereditament Form'
	Then User asserts below 'Billing Authority Links' details
		| Billing_Authority | BA_Reference                 | Effective_From          | Effective_To            | Status     |
		| Submitted By      | Proposed BA Reference Number | Proposed Effective Date |                         | Committed  |
		| Submitted By      | ba_reference                 | effective_from_date     | Proposed Effective Date | Superseded |
	And User closes browser


@ChangeofBAReference @E2E @P1_B @Regression @HP_E2E
#E2E England
Scenario: BAREF03_CTPRELMGMT-1424_[WAR-1035] Valid BA Reference Number for swap within Billing Authority of selected Hereditament and verify Autoprocess resolved the jobs
	Given User uses test data with ID 'BAR_005' from 'BAref' sheet
	And User connects to the DB and retrieves the '1' set of data for 'findHereditament_hillingdon_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |

	And User connects to the DB and retrieves the '2' set of data for 'findHereditament_hillingdon_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	Given User is logged in to Dynamics application to work for "BA Reference Swap Hereditament" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'Yes' value
	And User enter swap heriditament BA ref number for 'Proposed BA Reference Number' field value
	And User click on 'Billing Authority Link' label
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'

	
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'CBR_Request' in 'featureContext'
	
	And User clicks on 'Supplementary Job Requisition' under 'Request Action'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_002'
	And User click on 'Find Hereditament' button on 'dialog'
	And User enters data in "Postcode_new" field for swap heriditament
	And User clicked on 'Search' button
	And User slects spcific 'uprn_new' row from search hereditament results
	And User clicked on 'Select' button
	And user waits till app progress indicator disappears
	And User waits till Find Hereditament dialog disappears
	And User enters second heraditament  BA ref number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User waits till all 2 jobs has name displayed by "Refresh" grid
	#And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captured all 2 recons "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'BA Reference' tab from 'Request Form'
	And User click on 'New Proposed BA Reference Amendment' button
	And User scroll to 'Swap Hereditament' element
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'BA Reference' tab from 'Request Form'
	And User click on 'Save' button from 'menubar'
	Then user asserts Proposed BA Reference Amendments  row count '2' by "Refresh" grid
	And User clicks on 'Validate For Autoprocess' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Given User click on 'Jobs' under 'Service' section
	#And User 'Assign' 'Job Name' through 'All Jobs'
	And User 'Assign' 'Job_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element	
	And User click on 'Hereditament' link
	And User selects the 'Billing Authority Links' from the 'Related' tab from 'Hereditament Form'
	Then User asserts below 'Billing Authority Links' details
		| Billing_Authority | BA_Reference     | Effective_From          | Effective_To            | Status    |
		| Submitted By      | ba_reference	   | Proposed Effective Date |                         | Committed |
		| Submitted By      | ba_reference_new | effective_from_date_new | Proposed Effective Date | Committed |
	Given User click on 'Jobs' under 'Service' section	
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User 'Assign' 'Job_1' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User closes browser
	

@ChangeofBAReference @E2E @P1_B @Regression
#E2E Cardiff
Scenario: BAREF04_CTPRELMGMT-1424 [WAR-1035] Valid BA Reference Number for swap within Billing Authority of selected Hereditament and verify Autoprocess resolved the jobs
	Given User uses test data with ID 'BAR_006' from 'BAref' sheet
	And User connects to the DB and retrieves the '1' set of data for 'findHereditament_swansea_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |

	And User connects to the DB and retrieves the '2' set of data for 'findHereditament_swansea_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	Given User is logged in to Dynamics application to work for "BA Reference Swap Hereditament_wales" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'Yes' value
	And User enter swap heriditament BA ref number for 'Proposed BA Reference Number' field value
	And User click on 'Billing Authority Link' label
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'

	
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'CBR_Request' in 'featureContext'
	
	And User clicks on 'Supplementary Job Requisition' under 'Request Action'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_002'
	And User click on 'Find Hereditament' button on 'dialog'
	And User enters data in "Postcode_new" field for swap heriditament
	And User clicked on 'Search' button
	And User slects spcific 'uprn_new' row from search hereditament results
	And User clicked on 'Select' button
	And user waits till app progress indicator disappears
	And User waits till Find Hereditament dialog disappears
	And User enters second heraditament  BA ref number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User waits till all 2 jobs has name displayed by "Refresh" grid
	#And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captured all 2 recons "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'BA Reference' tab from 'Request Form'
	And User click on 'New Proposed BA Reference Amendment' button
	And User scroll to 'Swap Hereditament' element
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'BA Reference' tab from 'Request Form'
	And User click on 'Save' button from 'menubar'
	Then user asserts Proposed BA Reference Amendments  row count '2' by "Refresh" grid
	And User clicks on 'Validate For Autoprocess' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Given User click on 'Jobs' under 'Service' section
	#And User 'Assign' 'Job Name' through 'All Jobs'
	And User 'Assign' 'Job_0' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User selects the 'Billing Authority Links' from the 'Related' tab from 'Hereditament Form'
	Then User asserts below 'Billing Authority Links' details
		| Billing_Authority | BA_Reference     | Effective_From          | Effective_To            | Status    |
		| Submitted By      | ba_reference	   | Proposed Effective Date |                         | Committed |
		| Submitted By      | ba_reference_new | effective_from_date_new | Proposed Effective Date | Committed |
	Given User click on 'Jobs' under 'Service' section
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User 'Assign' 'Job_1' 'Job Name' through 'All Jobs' for Reconstitution
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display	
	And User closes browser
	

	@ChangeofBAReference @E2E @P2 @Regression
	#Covers -CTPRELMGMT-1423-[SIT] - [WAR-1035] Verify 'No Swap' process flow with Guardrails validation rules are applicable
Scenario: BAREF05_CTPRELMGMT-1427__CTPRELMGMT-1423_[SIT] - [WAR-1035] Invalid BA reference check and Guardrail validation rules for Swap process- Proposed BA Reference Number is matching with BA reference number of selected hereditament
	Given User uses test data with ID 'BAR_007' from 'BAref' sheet
	And User connects to the DB and retrieves the '1' set of data for 'findHereditament_canterbury_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |

	And User connects to the DB and retrieves the '2' set of data for 'findHereditament_canterbury_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	Given User is logged in to Dynamics application to work for "BA Reference _Invalid_Guardrails" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'Yes' value
	And User enter same hereditament BA ref number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	Then User verifies 'Proposed BA Reference Number : Invalid value of BA Reference Number. To swap a BA Reference number the proposed BA Reference Number must match with existing hereditament' Banner message
	And User entered random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User verifies 'Proposed BA Reference Number : Invalid value of BA Reference Number. To swap a BA Reference number the proposed BA Reference Number must match with existing hereditament' Banner message
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'No' value
	And User enter swap heriditament BA ref number for 'Proposed BA Reference Number' field value
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'No' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User verifies 'Proposed BA Reference Number : Value of Proposed BA Reference Number is in use. BA Reference Number must be unique within proposed billing authority.' Banner message
	Given User uses test data with ID 'BAR_006' from 'BAref' sheet
	And User connects to the DB and retrieves the '1' set of data for 'findHereditament_swansea_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |

	And User connects to the DB and retrieves the '2' set of data for 'findHereditament_swansea_BAREF'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	Given User click on 'Requests' under 'Service' section
	And User clicks on 'Discard changes' button on 'Unsaved changes' dialog,if appears
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Postcode_new" field for swap heriditament
	And User clicked on 'Search' button
	And User slects spcific 'uprn_new' row from search hereditament results
	#And User enters data in "Postcode" field
	#And User clicked on 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User clicks on 'Swap BA Reference Number?' dropdown and select 'Yes' value
	And User enter same hereditament BA ref number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	Then User verifies 'Proposed BA Reference Number : Invalid value of BA Reference Number. To swap a BA Reference number the proposed BA Reference Number must match with existing hereditament' Banner message
	And User entered random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User verifies 'Proposed BA Reference Number : Invalid value of BA Reference Number. To swap a BA Reference number the proposed BA Reference Number must match with existing hereditament' Banner message
	And User closes browser

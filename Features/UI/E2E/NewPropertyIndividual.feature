@UI
Feature: E2E New Property Individual BP

@NewProperty @E2E @P1_A @Regression @PPE_Smoke @UAT_Smoke @SIT_Smoke @TRN_Smoke @FAT_Smoke @mini_Regression
Scenario: NP01_CTPRELMGMT-1637_CTPRELMGMT-1521_CTPRELMGMT-1512_CTBT Integration For New Property Individual and large file upload
	Given User uses test data with ID 'NP_024' from 'NewProperty' sheet

	And User is logged in to Dynamics application to work for "NewProp_CTBT_Integration" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
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
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User scroll to 'Billing Authority Link' element
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Documents' tab from 'Request Form'
	#And user waits till progress indicator disappears
	#And User clicks on 'Upload' button and selects 'This Request'
	#And User clicks on 'Choose Files' and uploads the 'DummyUploadLarge' document
	#And User entered data for 'Document Type' field value on document dialog
	#And User clicks on 'Submit' on the Document Dialog
	#And User validates the upload status message
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
	And User looked for value 'BD - Detached bungalow' in 'Type' field
	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | New              |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
	And User switchs to deafult frame
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |              | No              | Insertion        | No            | Job Name |
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
	And User closes browser

@NewProperty @E2E @P1_A @Regression @mini_Regression
Scenario: NP02_CTPRELMGMT-1640_CTPRELMGMT-1599_Release And Publish without QA/QC covering PAD , Banding , Assessment , Corresspondence Check
	Given User uses test data with ID 'NP_024' from 'NewProperty' sheet
	And User is logged in to Dynamics application to work for "NewProp_E2E_Flow" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
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
	#And user enters data in "Postcode" and selects unique address for new property with db data
	#And user enters data in "Postcode" and selects unique address for new property
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
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
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Set Effective Date' button from 'menubar'
	And User entered 4 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User enter 'Automation testing ' in 'New Effective Date Reason' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	#And User closes dialog if still present
	And user waits till progress indicator disappears
	And User closes 'New Request Data Synchronisation' dialog if still present
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	Then User validates questionnaire in the 'Researching' stage
		| Questions                                                                 |
		| Is the property part of development of 10 or more?                        |
		| Are there plans of the property?                                          |
		| Are more than 1 self-contained units identified?                          |
		| Is this property a care home?                                             |
		| Is the property a HMO?                                                    |
		| Is the property occupied by more than 1 household?                        |
		| Has the new property been built on the curtilage of an existing property? |
		| Has the new property come into existence as a result of a reconstitution? |
		| Has a completion notice been issued?                                      |
		| Was the property previously used for non-domestic purposes?               |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
	And User looked for value 'BD - Detached bungalow' in 'Type' field
	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
	#And User looked for first element 'Age Code' field value only when data not entered
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User clicked on 'New Comparable Property Set' button
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' after CTBT is loaded
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From                      | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | New              |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From                      | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
	And User switchs to deafult frame
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From                      | Effective_To | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | New Proposed Effective Date Updated |              | No              | Insertion        | No            | Job Name |
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
	And user waits till 'Saving...' 'progressbar' disappears
	And User captures 'Message' text area field in 'featureContext'
	And User closes browser

@NewProperty @SIT @P1_A @Regression @Integration @LAportal @SIT_Smoke @PPE_Smoke @HP_E2E
Scenario: NP03_CTPRELMGMT-1633_LA Portal Integration - Individual Optimised
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	#And User is logged in to LA Portal
	And User is logged in to LA Portal to work for "NewProp_LA_Portal_Submission" case
	When I click Single report tab
	Then I choose 'CR03' as the reason code for the submission
	And User enter details on References page for CR03
	And User selects the postcode and Address for the CR03 Portal request
	And User answers the questionnaire about Planning Portal Reference
	And User enter details on Contact Details page
	And User enter EFfective Date and Remarks on Change request details page
	And I should be able to see "You have successfully submitted your report to the Valuation Office Agency" message on the screen
	Given User is logged in
	And User collapse if site map navigation expanded on left pane
	And User navigates to 'Submissions' under 'Service'
	And user waits till app progress indicator disappears
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	And user waits till app progress indicator disappears
	And user waits till progress indicator disappears
	Then User validates the field values in Remarks section under Summary tab
	And User closes browser

@NewProperty @SIT @P2 @Regression
Scenario: NP04_CTPRELMGMT-1513_[SIT] - BST-135626- Verify user can not create new valuation office agency account
	Given User uses test data with ID 'BAR_004' from 'BAref' sheet
	And User is logged in to Dynamics application to work for "Account Validation" case
	And User collapse if site map navigation expanded on left pane
	And User clicks on 'Create New Record. New' button from top Banner
	And User click on 'Account' button from the list
	And User enter data for 'Account Name' field value
	And User looked for value 'Valuation Office Agency' in 'Type' field
	And User clicked on 'Save and Close' button on new UI
	And user waits till app progress indicator disappears
	Then user validated 'Users are not permitted to add or update Billing Authority or Valuation Office Agency data. Please speak to the system administrator for assistance' text
	And User clicks on 'OK' button element
	And User closes browser

@NewProperty @SIT @P2 @Regression
Scenario: NP05_CTPRELMGMT-1522_[SIT] - [SIT] INC3244752 - Validate the account record for 'Valuation Office Agency' needs to be locked so it can't be amended by users
	Given User is logged in to Dynamics application to work for "Account Validation" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User filters 'Submitted By' coloumn  with 'Valuation office agency' and navigate to it
	#And user waits for '5' secs
	And user waits till progress indicator disappears
	Then user validated 'Users are not permitted to add or edit Billing Authority or Valuation Office Agency data. Please speak to the system administrator for assistance.' text
	And User clicks on 'OK' button element
	And User closes browser

@NewProperty @Regression @SIT
Scenario: NP06_CTPRELMGMT-1637_CTPRELMGMT-1494_CTPRELMGMT-1462_SLA and Linked Assessment validation
	Given User uses test data with ID 'TD_003' from 'ReEntryNewProperty' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bournemouth'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "NewPropReEntryDeletion_E2E_Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Full Demolition'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Remarks' element
	And User enter data for 'Formal Decision Notes' text area field value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Deletion         |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'TD_004'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '10' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'New Entry Checks' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User enter data for 'Reason For Validation' field value
	And user waits till app progress indicator disappears
	And User waits till ProgressRing disappears
	And User scroll to 'New Entry Checks' element
	And User clicks on 'Property Deleted By Mistake?' dropdown and select 'No' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Administration' tab from 'Request Form'
	Then User asserts 'Linked Assessment' is linked with assement 'Yes'
	And User click on 'Summary' tab from 'Request Form'
	Given User uses test data with ID 'TD_003' from 'ReEntryNewProperty' sheet
	And User modified value 'New Property - Individual' in 'Job Type' field
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And user waits till progress indicator disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Administration' tab from 'Request Form'
	Then User asserts 'Linked Assessment' is linked with assement 'No'
	And User scroll to 'SLA KPI Instances' section
	Then user validated 'Noncompliant' text


	And User closes browser

@NewProperty @SIT @P2 @Regression
Scenario: NP07_CTPRELMGMT-2560_[SIT] - [WAR-1212] -New Property-Individual(Wales)- Validate Error message on Proposed effective date field if date chosen is before 1st April 2005 and verify data entry with new field 'Customer Supplied Proposed Effective Date'
	Given User uses test data with ID 'NP_003' from 'NewProperty' sheet
	And User is logged in to Dynamics application to work for "NewProp_Proposed_Effective_Date" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date of 'BaseProposedEffectiveDate' for 'Proposed Effective Date' field value
	And User entered 0 days before date for 'Customer Provided Proposed Effective Date' field value
	And user waits till app progress indicator disappears
	And User scroll to 'Billing Authority Link' element
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User scroll to 'Billing Authority Link' element
	And user waits till progress indicator disappears
	And user waits till app progress indicator disappears
	And User enter community code number for "Proposed BA Reference Number" field value
	And User click on 'Save' button from 'menubar'
	Then User verifies 'Proposed Effective Date : cannot be before 01/04/2005.' Banner message
	And User scroll to 'Billing Authority Link' element
	And User entered 2 days after hereditament 'BaseProposedEffectiveDate' for  from calender for 'Proposed Effective Date' field value on 'presentation'
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
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Set Effective Date' button from 'menubar'
	And User entered 4 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User enter 'Automation testing ' in 'New Effective Date Reason' field
	And User click on 'Save' button from 'dialog'
	Then User verifies 'New Proposed Effective Date : cannot be before 01/04/2005.' Banner message
	
	And User entered 1 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And user waits till progress indicator disappears
	And User closes 'New Request Data Synchronisation' dialog if still present
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User closes browser

	@NewProperty @SIT @P2 @Regression
Scenario: NP08_CTPRELMGMT-394_[SIT]-CTPCASE-357-INC3512598-Verify that user can not unlock stages after the job is released/completed
Given User uses test data with ID 'NP_003' from 'NewProperty' sheet
	And User is logged in to Dynamics application to work for "NewProp_E2E_no unlock option should be present after job is resolved" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
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
	
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User scroll to 'Billing Authority Link' element
	And user waits till progress indicator disappears
	And user waits till app progress indicator disappears
	And User enter community code number for "Proposed BA Reference Number" field value
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
	
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates questionnaire in the 'Researching' stage
		| Questions                                                                 |
		| Is the property part of development of 10 or more?                        |
		| Are there plans of the property?                                          |
		| Are more than 1 self-contained units identified?                          |
		| Is this property a care home?                                             |
		| Is the property a HMO?                                                    |
		| Is the property occupied by more than 1 household?                        |
		| Has the new property been built on the curtilage of an existing property? |
		| Has the new property come into existence as a result of a reconstitution? |
		| Has a completion notice been issued?                                      |
		| Was the property previously used for non-domestic purposes?               |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
	And User looked for value 'BD - Detached bungalow' in 'Type' field
	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
	
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
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
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And the 'Unlock Stage' button should not be visible
	And User clicked on 'Undertake Banding' BPF Journey button
	And user waits till app progress indicator disappears
	And the 'Set Active' button should not be visible
	And User closes business process stage container
	
	And User clicked on 'Researching' BPF Journey button
	And user waits till app progress indicator disappears
	And the 'Set Active' button should not be visible
	And User closes business process stage container

	And User clicked on 'Details' BPF Journey button
	And user waits till app progress indicator disappears
	And the 'Set Active' button should not be visible
	And User closes business process stage container

	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And user waits till app progress indicator disappears
	And the 'Unlock Stage' button should not be visible
	And User clicked on 'Undertake Banding' BPF Journey button	
	And the 'Set Active' button should not be visible
	And User closes business process stage container
	And User closes browser
@UI
Feature: NewPropertyReEntry

@NewPropertyReEntry @E2E @P1_C @Regression @mini_Regression
#covered CTPRELMGMT-1592  in this scenario
#covers CTPRELMGMT-1549	[SIT] Re-Entry can access Effective Date Change at Desktop Research
#covers CTPRELMGMT-1533 [SIT] Welsh Reform Proposal - Validate owner gets updated for job as well as request
#covers -CTPCASE-991-INC3616630 - VOS Work Allocation Changes Request
Scenario: NPRE01_CTPRELMGMT-1649_CTPRELMGMT-1647_CTPRELMGMT-1648_CTPRELMGMT-1655_CTPRELMGMT-1592_CTPRELMGMT-1554_Create and Validate a New Property Re entry until Release and Publish
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
	#And User clicks on 'Is Caravan, Boat or Annex?' dropdown and select 'No' value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
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
	#And User enter data for 'Reason For Validation' field value
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
	#And User enter random number for 'Proposed BA Reference Number' field value
	And user waits till app progress indicator disappears
	And User waits till ProgressRing disappears
	And User scroll to 'New Entry Checks' element
	And User clicks on 'Property Deleted By Mistake?' dropdown and select 'No' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Summary' tab from 'Request Form'
	And User click on 'Refresh' button from 'menubar' untill 'SELF-CATERING TEAM 1' status display
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Set Effective Date' button from 'menubar'
	And User entered 5 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User enter 'Automation testing ' in 'New Effective Date Reason' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From                      | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              |         | No            | Current (live entry) | Unpublished       | New              |
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
		| effective_from_date                 |              |                   | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User selects the 'Billing Authority Links' from the 'Related' tab from 'Hereditament Form'
	Then User asserts below 'Billing Authority Links' details
		| Billing_Authority | BA_Reference                 | Effective_From                      | Effective_To                        | Status    |
		| Submitted By      | Proposed BA Reference Number | New Proposed Effective Date Updated |                                     | Committed |
		| Submitted By      | ba_reference                 | effective_from_date                 | New Proposed Effective Date Updated | Committed |
	And User closes browser

@NewPropertyReEntry @SIT @Regression @HP_E2E
Scenario: NPRE02_CTPRELMGMT-1656_LA Portal Single New Property to re-enter Request for Deleted Properties (into the CT List) Submission via LA Portal
	Given User uses test data with ID 'TD_001' from 'ReEntryNewProperty' sheet
	And User is logged in to LA Portal
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
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	And user waits till progress indicator disappears
	Then User validates the field values in Remarks section under Summary tab


@NewPropertyReEntry @E2E @Regression @mini_Regression
#CTPRELMGMT-1473 -[SIT][BST-132283][INC2998623]User should be able to create New property re-entry with same BA reference Number
Scenario: NPRE03_CTPCASE-991_Create and Validate a New Property Re entry until Release and Publish -INC3616630 - VOS Work Allocation Changes Request
	Given User uses test data with ID 'TD_004' from 'ReEntryNewProperty' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCWales_New_2005_Baref'
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
	#And User clicks on 'Is Caravan, Boat or Annex?' dropdown and select 'No' value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
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
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'TD_005'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	#And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User scroll to 'New Entry Checks' element
	#And User enter community code number for "Proposed BA Reference Number" field value
	And User enters data for  "Proposed BA Reference Number" field
	And User enter data for 'Reason For Validation' field value
	And user waits till app progress indicator disappears
	And User waits till ProgressRing disappears
	And User scroll to 'New Entry Checks' element
	And User clicks on 'Property Deleted By Mistake?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#And User click on 'Summary' tab from 'Request Form'
	#And User click on 'Refresh' button from 'menubar' untill 'SELF-CATERING TEAM 2' status display
	#CT National Team 129
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
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
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | New              |
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
		| Effective_From          | Effective_To            | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                         | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
		| effective_from_date     | Proposed Effective Date |                   | No            | Previously Current   | Published         | New              |
	And User closes browser

@Ignore
Scenario: NPRE04_CTPRELMGMT-1633_LA Portal Integration - Individual Optimised
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'FindDeletedHereditament_Bristol_LA_Portal'
		| fieldName           |
		| band                |
		| uprn                |
		| building_number     |
		| street              |
		| locality            |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_reference        |
		| ba_code             |
		| ba_name             |
	And User is logged in to LA Portal to work for "NewPropREEntry_LA_Portal_Submission" case
	When I click Single report tab
	Then I choose 'CR03' as the reason code for the submission
	And User enter details on References page from db
	And User selects the postcode and Address from db for the CR03 Portal request
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

@NewPropertyReEntry @E2E @Regression
Scenario: NPRE05_CTPRELMGMT-1508_[SIT] CT New Property Re-Entry, Quality Assurance, sign-off is required and QA is approved
	Given User uses test data with ID 'NP_007' from 'NewPropReEntry' sheet
	And User connects to the DB and retrieves the data for 'FindDeletedHereditament_Bristol_LA_Portal'
		| fieldName           |
		| band                |
		| uprn                |
		| building_number     |
		| street              |
		| locality            |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_reference        |
		| ba_code             |
		| ba_name             |
	And User is logged in to Dynamics application to work for "NP_ReEntry_QA_Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 0 days before date for 'Date Received' field value
	And User enters '10' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results
	And User slects spcific 'uprn' row 'Delete' by clicking on 'Check Band' from search hereditament results
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
	And User clicked on 'Alerts' tab under 'Request Form'
	And User clicked on 'New Alert' button under 'Property Alerts' grid
	And User looked for 'Alert Type' field value
	And User entered 0 days before date for 'Effective From' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Summary' tab from 'Request Form'
	And User click on 'Refresh' button from 'menubar' untill 'SELF-CATERING TEAM 1' status display
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | New              |
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
		| effective_from_date     |              |                   | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User clicked on 'Details' tab under 'Job Form'
	And User scroll to 'Hereditament Details' element
	And User click on 'Hereditament' link
	And User selects the 'Billing Authority Links' from the 'Related' tab from 'Hereditament Form'
	Then User asserts below 'Billing Authority Links' details
		| Billing_Authority | BA_Reference                 | Effective_From                      | Effective_To                        | Status    |
		| Submitted By      | Proposed BA Reference Number | New Proposed Effective Date Updated |                                     | Committed |
		| Submitted By      | ba_reference                 | effective_from_date                 | New Proposed Effective Date Updated | Committed |
	And User closes browser

@NewPropertyReEntry @E2E @Regression
Scenario: NPRE06_CTPRELMGMT-2750_[SIT] [CTPCASE-496]-New Property Re-Entry - Validate User can execute Re-entry end to end without an error
	Given User uses test data with ID 'TD_007' from 'ReEntryNewProperty' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Wolverhampton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Borderlin CT to NDR_E2E_Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '7' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User click on 'Summary' tab from 'Request Form'
	And User click on 'Refresh' button from 'menubar' untill 'BORDERLINE TEAM 5' status display
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Set Effective Date' button from 'menubar'
	And User entered 5 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User enter 'Automation testing ' in 'New Effective Date Reason' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Borderline CT to NDR'
	Then User validates the Pop-ups for 'Borderline CT to NDR' on the Dekstop Reaserch stage
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From                      | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
		| Effective_From                      | Effective_To                        | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |                                     |         | No            | Current (live entry) | Published         | Deletion         |
		| effective_from_date                 | New Proposed Effective Date Updated |         | No            | Previously Current   | Published         | New              |
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
	#And User enter data for 'Reason For Validation' field value
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
	#And User enter random number for 'Proposed BA Reference Number' field value
	And user waits till app progress indicator disappears
	And User waits till ProgressRing disappears
	And User scroll to 'New Entry Checks' element
	And User clicks on 'Property Deleted By Mistake?' dropdown and select 'No' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Summary' tab from 'Request Form'
	And User click on 'Refresh' button from 'menubar' untill 'SELF-CATERING TEAM 1' status display
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User click on 'Set Effective Date' button from 'menubar'
	And User entered 5 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User enter 'Automation testing ' in 'New Effective Date Reason' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From                      | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              |         | No            | Current (live entry) | Unpublished       | New              |
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
		| effective_from_date                 |              |                   | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User closes browser
		| Effective_From          | Effective_To		  | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |						  | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
		| effective_from_date     |Proposed Effective Date|                   | No            | Previously Current   | Published         | New              |
		And User closes browser


@NewPropertyReEntry @E2E @Regression
Scenario: NPRE07_CTPRELMGMT-1544_[SIT]-CT [BST-134437]-E2E- New property Re-entry - Validate user can use clone to new date functionality for pending set of pads and complete the process
Given User uses test data with ID 'DE_002' from 'DataEnhancement' sheet
Given User is logged in to Dynamics application to work for "E2E_Reentry_clone to new date" case
And User collapse if site map navigation expanded on left pane
And User connects to the DB and retrieves the data for 'findhereditament_DE_new_Canterbury'
	| fieldName           |
	| uprn                |
	| effective_from_date |
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

Given User uses test data with ID 'TD_010' from 'Deletion' sheet
Given User is logged in to Dynamics application to work for "NewPropReEntryDeletion_E2E_Process" case
And User collapse if site map navigation expanded on left pane
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value
And User looked for 'Submitted By' field value
#And User clicks on 'Is Caravan, Boat or Annex?' dropdown and select 'No' value
And User looked for 'CT Payer' field value
And User entered 0 days before date for 'Date Received' field value
#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
#Given User click on 'Queues' under 'Service' section
#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
And User click on 'Jobs' under 'Service' section
And User 'Assign' 'Job Name' through 'All Jobs'
#And User 'Assign' 'Job ID' through 'All Jobs'
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on "Job Id" element
And User waits till 'Details' stage selected
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
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
And User asserts below 'Created Assessments' details
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
And User asserts below 'History' details
	| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Deletion         |
	| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
And User switchs to deafult frame

And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'TD_008'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
And User looked for 'Data Source Role' field value
And User clicks on 'Channel' dropdown and select 'Email' value
And User enter data for 'BA Report Number' field value
#And User enter data for 'Reason For Validation' field value
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
#And User enter random number for 'Proposed BA Reference Number' field value
And user waits till app progress indicator disappears
And User waits till ProgressRing disappears
And User scroll to 'New Entry Checks' element
And User clicks on 'Property Deleted By Mistake?' dropdown and select 'No' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Validate Request' under 'Request Action'
And User click on 'Save & Close' button from 'dialog'
And User waits till 'dialog' disappears
And User click on 'Related Jobs' tab from 'Request Form'
And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
And User click on 'Summary' tab from 'Request Form'
And User click on 'Refresh' button from 'menubar' untill 'SELF-CATERING TEAM 1' status display
#Given User click on 'Queues' under 'Service' section
#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
And User click on 'Jobs' under 'Service' section
And User 'Assign' 'Job Name' through 'All Jobs'
#And User 'Assign' 'Job ID' through 'All Jobs'
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on "Job Id" element
And User waits till 'Details' stage selected
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User selects 'Pending' record
And User clicked on 'Clone to New Date' button
And User clicked on 'Committed' button
And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
And User clicked on 'Continue' button
And user waits till loading spinner disappears
And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User waits till record gets 'Saved'
And User enter Property Attributes
And User enter data for 'Floors' field value only when data not entered
And User looked for 'Conservatory Type' field value only when data not entered
And User enter data for 'Conservatory Area' field value only when data not entered
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Add New Source Code' button
And User looked for 'Source Code' field value
And User enter data for 'Comment' field value
And User click on 'Save & Close' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User scroll to 'PAD Validation' element
And User click on 'Validate PAD Code' toggle button
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validate value 'Pass' for 'PAD Validation Outcome' field
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Undertake Banding' stage selected
And User closes business process stage container
And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
And User clicked on 'Banding' tab under 'Job Form'
And User enter data for Caseworker Conclusions / Remarks / Thought Process field
And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
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
And User asserts below 'Created Assessments' details
	| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | New              |
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
And User asserts below 'History' details
	| Effective_From          | Effective_To		  | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| Proposed Effective Date |						  | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
	| effective_from_date     |Proposed Effective Date|                   | No            | Previously Current   | Published         | New              |
	And User closes browser


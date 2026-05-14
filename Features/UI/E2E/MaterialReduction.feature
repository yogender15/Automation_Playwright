@UI
Feature: Material Reduction

@Regression @materialReduction @SIT @P1_B @Integration @SharePoint @SIT_Smoke
#CTPRELMGMT-1732_CR07 Material Reduction - Create a Material Reduction request and Job - internal user
#CTPRELMGMT-1516_[SIT] -[BST-125833] - Validate user should be able to search hereditament using UPRN filter
Scenario: MR01_CTPRELMGMT-1730_CTPRELMGMT-1516_CTPRELMGMT-1732_SharePoint Integration - Material Reduction and BST-92564 for Composite Dwelling Property
	Given User uses test data with ID 'MR_001' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| uprn      |
	And User is logged in to Dynamics application to work for "BST-80545_SharePoint" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
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
	Then User validates and clicks the 'Documents' tab present in the 'Desktop Research Form' tablist
	And user waits till progress indicator disappears
	And User clicks on 'Upload' button and selects 'This Job'
	And User clicks on 'Choose Files' and uploads the document
	And User entered data for 'Document Type' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message
	And User closes browser

#@Regression @materialReduction @E2E @P1_B @mini_Regression
##CTPRELMGMT-1525 - Correspondence should not go into "Sent - Failed to save a copy" status
#Scenario:MR02_CTPRELMGMT-1727_BST-141812[SIT]-CT -E2E- Alteration - CR07 Material Reduction-Verify the Notice of Alteration(V7704) can be sent out as part of Alteration Release and Publish when there's a band with effective date change (Decrease)
#	Given User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
#	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
#		| fieldName           |
#		| town                |
#		| postcode            |
#		| uprn                |
#		| effective_from_date |
#	And User is logged in to Dynamics application to work for "MR_E2E_80581" case
#	And User collapse if site map navigation expanded on left pane
#	And User click on 'Requests' under 'Service' section
#	And User click on 'New' button from 'menubar'
#	And User looked for 'Job Type' field value
#	And User looked for 'Submitted By' field value
#	#And User looked for 'Relationship Role' field value
#	And User entered 0 days before date for 'Date Received' field value
#	And User entered 25 days before date for 'Proposed Effective Date' field value
#	And User scroll to 'Planning Details' element
#	And User enter data for 'Reason for Portal Reference Omission' text area field value
#	And User looked for 'Data Source Role' field value
#	And User clicks on 'Channel' dropdown and select 'Email' value
#	And User enter data for 'BA Report Number' field value
#	And User enter data for 'Reason For Validation' field value
#	And User click on 'Find Hereditament' button
#	And User enters data in "Town/City" field
#	And User enters data in "Postcode" field
#	And User clicked on 'Search' button
#	And User slects spcific 'uprn' row from search hereditament results
#	And User clicked on 'Select' button
#	And User waits till Find Hereditament dialog disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicks on 'Validate Request' under 'Request Action'
#	And User click on 'Save & Close' button from 'dialog'
#	And User waits till 'dialog' disappears
#	And User click on 'Related Jobs' tab from 'Request Form'
#	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
#	#Given User click on 'Queues' under 'Service' section
#	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
#	And User click on 'Jobs' under 'Service' section
#	And User 'Assign' 'Job Name' through 'All Jobs'
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on "Job Id" element
#	And User waits till 'Details' stage selected
#	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
#	And User waits till 'Researching' stage selected
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validates questionnaire in the 'Researching' stage
#		| Questions                                                      |
#		| Is it part of an on-going scheme?                              |
#		| Are plans available?                                           |
#		| Are the adaptations for a disabled person?                     |
#		| Has there been a change to the physical state of the locality? |
#	And User clicked on 'PVT' tab under 'Desktop Research Form'
#	And User selects 'Committed' record
#	And User get PAD attributes of 'Committed' record
#	And User clicked on 'Clone to New Date' button
#	And User clicked on 'Committed' button
#	And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
#	And User clicked on 'Continue' button
#	And user waits till app progress indicator disappears
#	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
#	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	#And User waits till record gets 'Saved'
#	And User enter Property Attributes
#	#And User enter data for 'Floors' field value only when data not entered
#	#And User enter data for 'Level' field value only when data not entered
#	#And User looked for 'Parking' field value only when data not entered
#	And User looked for 'Conservatory Type' field value only when data not entered
#	And User enter data for 'Conservatory Area' field value only when data not entered
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Add New Source Code' button
#	And User looked for 'Source Code' field value
#	And User enter data for 'Comment' field value
#	And User click on 'Save & Close' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User scroll to 'PAD Validation' element
#	And User click on 'Validate PAD Code' toggle button
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validate value 'Pass' for 'PAD Validation Outcome' field
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
#	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
#	And User waits till 'Undertake Banding' stage selected
#	#And User clicked on 'Undertake Banding' BPF Journey button
#	And User closes business process stage container
#	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
#	And User clicked on 'Banding' tab under 'Job Form'
#	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
#	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
#	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
#	And User waits till 'Maintain Assessment' stage selected
#	And User closes business process stage container
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User waits till ProgressRing disappears
#	And User switchs to Assessment frame
#	And User clicked on 'Created Assessments' button
#	And User asserts below 'Created Assessments' details
#		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
#	And User switchs to deafult frame
#	And User clicked on 'Maintain Assessment' BPF Journey button
#	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Yes' button on 'Complete Job' dialog
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
#	And User clicked on 'Details' tab under 'Job Form'
#	And User click on 'Request' link
#	And User clicks on 'Release and Publish' under 'Request Action'
#	And User clicks on 'OK' button element
#	And User closes dialog if still present
#	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User switchs to Assessment frame
#	And User clicked on 'History' button
#	And User asserts below 'History' details
#		| Effective_From          | Effective_To            | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |                         | Proposed Tax Band | No            | Current (live entry) | Published         |                  |
#		| effective_from_date     | Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
#	And User switchs to deafult frame
#	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
#	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
#	And User click on correspondence "Job Id" element
#	And User clicks on 'Status Reason' dropdown and select 'Ready' value
#	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
#	And User selected 'Integration Messages' under 'Related' tab
#	And User click on messages "Job Id" element
#	And User captures 'Message' text area field in 'featureContext'
#	And User validates 'Quadient Message' contains 'CL25' data
#	And User closes browser

@Regression @materialReduction @E2E @P1_B
#CTPRELMGMT-1095-SIT - CTPCASE-113 - Verify that assessment is published after Request resolution
Scenario: MR03_CTPRELMGMT-1725_CTPRELMGMT-1095_[SIT]-CT - Alteration - CR07 Material Reduction-Verify the Notice of Alteration(V7704) can be sent out as part of Alteration Release and Publish when there's a band change(Decrease) and composite indicator is added
	Given User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_E2E_MigratedData" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Linked Assessment' element
	And User clicks on 'Composite Indicator' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	#And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | Yes           | Current (live entry) | Unpublished       | Alteration       |
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
		| Proposed Effective Date |                         | Proposed Tax Band | Yes           | Current (live entry) | Published         |                  |
		| effective_from_date     | Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
	And User switchs to deafult frame
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
	Then User validates 'Quadient Message' contains '(Composite)' data
	Then User validates 'Quadient Message' contains 'CL25' data
	And User closes browser

@MandatedDelay
Scenario: MR04_CTPRELMGMT-1726[SIT]-CT-Alteration-CR07 Material Reduction-Verify the Notice of Alteration(V7704) can be sent out as part of Alteration Release and Publish when there's a band change(Increase)
	Given User uses test data with ID 'MR_001' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT_Increase'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_E2E_80582_Increase" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	#And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and increased 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	#And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
	And User click on 'Refresh' button from 'menubar' untill 'Mandated Delay' status display
	And User closes browser

@Regression @materialReduction @E2E @P1_B
Scenario: MR05_CTPRELMGMT-1547_ [SIT]-CT [BST-134437-E2E- Material Reduction - Validate user can use clone to new date functionality for pending set of pads and complete the process end to end
	Given User uses test data with ID 'DE_001' from 'DataEnhancement' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_E2E_Pending_137778" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
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
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
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
	#E2E journey of pending record with material Reduction
	And User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'MaterialRedcution' for 'MR_003'
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates questionnaire in the 'Researching' stage
		| Questions                                                      |
		| Is it part of an on-going scheme?                              |
		| Are plans available?                                           |
		| Are the adaptations for a disabled person?                     |
		| Has there been a change to the physical state of the locality? |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Pending' record
	And User get PAD attributes of 'Pending' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till record gets 'Saved'
	And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
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
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
		| Proposed Effective Date |                         | Proposed Tax Band | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
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
	Then User validates 'Quadient Message' contains 'CL25' data
	And User closes browser


@QAQC @Regression @materialReduction @E2E
#Covers CTPRELMGMT-1555 -[SIT] [WAR-255] Validate unlock stage is visible on desktop research
#covers CTPRELMGMT-1491 -[SIT][BST-141941] Validate unlock stage is working
Scenario: MR06_CTPRELMGMT-1502 [SIT]-[BST-18947]-Material Reduction-Validate QA Review is generated when the property band has decreased by two or more step counts
	Given User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire_MR06'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_E2E_80581" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	And User waits till record gets 'Saved'
	And User click on 'Save' button from 'menubar'
	And User waits till record gets 'Saved'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
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
	And User waits till record gets 'Saved'
	Then User validates questionnaire in the 'Researching' stage
		| Questions                                                      |
		| Is it part of an on-going scheme?                              |
		| Are plans available?                                           |
		| Are the adaptations for a disabled person?                     |
		| Has there been a change to the physical state of the locality? |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till record gets 'Saved'
	And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And User waits till record gets 'Saved'
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	#And User looked for 'Proposed Tax Band' single character field value
	And User looked for 'Proposed Tax Band' and reduced 2 step from "Current Tax Band" band value
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
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User click on 'Unlock Stage' button from 'menubar'
	And User selects 'Change/Revalidate Pads' from 'unlockjobstage' this dropdown
	And User clicked on 'Confirm' button
	And user waits till 'Unlock Stage is in progress' icon disappears
	#And user waits for '30' secs
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
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
	And User selects 'Committed' record row
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Banding' tab under 'Job Form'
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Maintain Assessment' BPF Journey button
	#And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	#And User closes business process stage container
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'Quality Review?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Approval' status display
	And User closes browser

@Regression @materialReduction @E2E
Scenario: MR07_CTPRELMGMT-1498_Validate correct error message is displayed when request is created with same hereditament and same proposed effective date
	Given User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_E2E_Duplicate" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid

	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	Then User verifies 'duplicate of another Request' Banner message
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
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
		| Questions                                                      |
		| Is it part of an on-going scheme?                              |
		| Are plans available?                                           |
		| Are the adaptations for a disabled person?                     |
		| Has there been a change to the physical state of the locality? |
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till record gets 'Saved'
	And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	#And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
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
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
		| Proposed Effective Date |                         | Proposed Tax Band | No            | Current (live entry) | Published         |                  |
		| effective_from_date     | Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
	And User switchs to deafult frame
	And User closes browser


@Regression @materialReduction @SIT @Integration @SharePoint
Scenario: MR08_CTPRELMGMT-495 - [INC3530256 & INC3535794 ] : Validate updating details for a document should not throw error
	Given User uses test data with ID 'MR_001' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| uprn      |
	And User is logged in to Dynamics application to work for "Upload and Update file_SharePoint" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
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
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
	#And User validates and clicks the 'Documents' tab present in the 'Desktop Research Form' tablist
	And User click on 'Documents' tab from 'Request Form'
	And user waits till progress indicator disappears
	And User clicks on 'Upload' button and selects 'This Request'
	And User clicks on 'Choose Files' and uploads the document
	And User entered data for 'Document Type' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message
	And user click on 'VOA provided' row under file upload section
	And User click on 'Edit Details' from the options
	And User entered data for 'Description' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the status message after file update
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
	Then User validates and clicks the 'Documents' tab present in the 'Desktop Research Form' tablist
	And user waits till progress indicator disappears
	And User clicks on 'Upload' button and selects 'This Job'
	And User clicks on 'Choose Files' and uploads the document
	And User entered data for 'Document Type' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message
	And user click on 'VOA provided' row under file upload section
	And User click on 'Edit Details' from the options
	And User entered data for 'Description' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the status message after file update
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User uses test data with ID 'Proposals_005' from 'Proposals' sheet
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 25 days after date for 'Evidence Sufficient Date' field value
	And User clicks on 'Channel' dropdown and select 'Phone' value
	And User looked for 'Task Type' field value
	And User looked for 'Contact Type' field value
	And User looked for 'Cust. Enquiry Type' field value
	And User looked for 'To Unit' field value
	And User looked for 'Cust. Enquiry Sub Type' field value
	And User looked for 'Cust. Enquiry Sub Type 2' field value
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates and clicks the 'Documents' tab present in the 'Customer Enquiry Form' tablist
	And user waits till progress indicator disappears
	And User clicks on 'Upload' button and selects 'This Enquiry'
	And User clicks on 'Choose Files' and uploads the document
	And User entered data for 'Document Type' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message
	And user click on 'VOA provided' row under file upload section
	And User click on 'Edit Details' from the options
	And User entered data for 'Description' field value on document dialog
	And User clicks on 'Submit' on the Document Dialog
	And user waits till progress indicator disappears
	Then User validates the status message after file update
	And User closes browser


	







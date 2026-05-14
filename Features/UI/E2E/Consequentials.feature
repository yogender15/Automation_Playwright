@UI
Feature: Consequentials


@Consequentials
Scenario: CBR01_CTPRELMGMT-1865_SIT - [CTPCASE-664] Consequential Band Review Correspondence Band Decrease
	Given User uses test data with ID 'CBR_001' from 'ConsequentialsBandReview' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CBR_CTPRELMGMT-1865" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
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
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	Then user asserts 'Created Assessments' row count '1'
	And user selects '1' Assessment and clicked on 'View' button
	And User switchs to deafult frame
	And user waits till app progress indicator disappears
	Then User asserts 'Change Code' value as 'CL26 Band Review'
	And User click on 'Save & Close' button from 'dialog'
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till 'Saving...' 'progressbar' disappears
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
	Then User validates 'Quadient Message' contains 'CL26' data
	And User clicks on 'Go back' button
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Docuemnts' tab under 'Job Form'
	#a[title*='VO7704 CT Notice - Notice of Alteration']
	And User closes browser

@Consequentials
Scenario: Consequentials_DE01_CTPRELMGMT-504_SIT - CTPCASE-22 - Verify that Data Enhancement Request and Job is created when New Property job is released and published & user has identified Consequentials as Data enhancement
	Given User uses test data with ID 'NP_024' from 'NewProperty' sheet
	And User is logged in to Dynamics application to work for "Consequentials_DE_CTPRELMGMT-504" case
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
	And User clicks on 'Is Banding Complete?' dropdown and select 'No' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Consequentials' tab under 'Job Form'
	And User clicks on 'Identify Consequentials' dropdown and select 'Yes' value
	And user waits till 'Saving...' 'progressbar' disappears
	And User connects to the DB and retrieves the data for 'findHereditament_Manchester_New'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User open consequential record
	And User looked for 'Consequential Job Type' field value
	And User enter data for 'Remarks' text area field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Banding' tab under 'Job Form'
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
	And User clicked on 'Consequentials' tab under 'Job Form'
	And User open consequential record
	And user waits for '180' secs
	And User click on 'Refresh' button from 'menubar' untill 'Succeeding Request' has value display
	And User navigate to 'Succeeding Request' from consequential review item
	Then user asserts below fields for consequentials review item 'Data Enhancement '
		| fieldName        | value                  | feieldType |
		| Date Received    | Today                  | input      |
		| Target Date      | Today+5                | input      |
		| Data Source Role | Listing Officer Report | LookUp     |
		| Job Type         | Data Enhancement       | Lookup     |
		| Originating Job  | Job Name               | Lookup     |




	And User closes browser


@Consequentials
Scenario: Consequentials02_[SIT] [CTPCASE-167]- Validate the Send CT Notice of Alteration VO 7704 is generated if Band Decrease for Consequential Band Change-England Hereditament
	Given User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
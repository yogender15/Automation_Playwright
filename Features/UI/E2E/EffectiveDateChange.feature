@UI
Feature: Effective Date Change

@EDC @E2E @P1_B @Regression @mini_Regression @HP_E2E
#CTPRELMGMT-1452 - [SIT] - [BST-142646] - INC3341528 - Verify assessment is published after resolution of an effective Date Change Job
#CTPRELMGMT-1492 -[SIT] - [BST-136468] INC3251207- Validate generic name/team for system generated correspondences for effective date change jobs
Scenario: EDC01_CTPRELMGMT-1667_CTPRELMGMT-1452_Change of Effective Date-New Property Job for Future Date/After Date
	Given User uses test data with ID 'EDC_002' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findhereditament_EDCMR'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CTPRELMGMT-1667_EDC_E2E" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	#And User entered 25 days before date for 'Proposed Effective Date' field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       |                  |
		| effective_from_date     |              |         | No            | Previously Current   | Unpublished       | Deletion         |
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
		| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         |                  |
		| effective_from_date     | effective_from_date     |         | No            | Previously Current   | Published         |                  |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | Deletion         |
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
	Then User validates 'Quadient Message' contains 'CT Team' data
	And User closes browser

@EDC @E2E @EDC_DEL @P1_B @Regression @HP_E2E
Scenario: EDC02-DEL03_CTPRELMGMT-1671_CTPRELMGMT-1674_CTPRELMGMT-1669_Effective Date Change on Deletion - Forward/Same Date
	Given User uses test data with ID 'TD_003' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForDel'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CTPRELMGMT-1671_1674_1669_Del_EDC_E2E_Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '0' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates the Dekstop Research Questionnaire for 'Deletion'
		| Questions                                                                                                                     |
		| Is the property Occupied?                                                                                                     |
		| Is the property a boat, caravan?                                                                                              |
		| Is the request for deletion as a result of a reconstitution?                                                                  |
		| Is the property an Annexe?                                                                                                    |
		| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
		| Is the request to delete due to the property being demolished?                                                                |
		| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
		| Is the request to delete due to the property being derelict?                                                                  |
		| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
		| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
		| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Proposed Assessments' button
	Then User asserts below 'Proposed Assessments' details
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
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'EDC_001'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
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
		| Effective_From          | Effective_To        | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                     |         | No            | Current (live entry) | Published         | Deletion         |
		| effective_from_date     | effective_from_date |         | No            | Previously Current   | Published         | Deletion         |
		| effective_from_date     | effective_from_date |         | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User closes browser

@EDC  @EDC_MR @E2E @P1_B @Regression @HP_E2E
#CTPRELMGMT-1525 - Correspondence should not go into "Sent - Failed to save a copy" status
Scenario: EDC03_MR02_CTPRELMGMT-1727_CTPRELMGMT-1525_CTPRELMGMT-1666_Effective Date Change on Material Reduction - Forward/Future Date
	Given User uses test data with ID 'MR_002' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Boston'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CTPRELMGMT-1666_MR_E2E_MigratedData" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value for 'material redcution' request
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
		| Effective_From                             | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| material redcution_Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
		| Effective_From                             | Effective_To                               | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| material redcution_Proposed Effective Date |                                            | Proposed Tax Band | No            | Current (live entry) | Published         |                  |
		| effective_from_date                        | material redcution_Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
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
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'EDC_003'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User scroll to 'Billing Authority Link' element
	#And User enters '4' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '4' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value for 'effective date change' request
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From                                | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| effective date change_Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | Alteration       |
		| material redcution_Proposed Effective Date    |              |         | No            | Previously Current   | Unpublished       | Alteration       |
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
		| Effective_From                                | Effective_To                                  | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| effective date change_Proposed Effective Date |                                               |         | No            | Current (live entry) | Published         | Alteration       |
		| material redcution_Proposed Effective Date    | effective date change_Proposed Effective Date |         | No            | Previously Current   | Published         | Alteration       |
		| material redcution_Proposed Effective Date    | material redcution_Proposed Effective Date    |         | No            | Previously Current   | Published         | Alteration       |
		| effective_from_date                           | material redcution_Proposed Effective Date    |         | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User closes browser
	

@EDC @E2E @P1_B @Regression @mini_Regression @FAT_Smoke @SIT_Smoke @UAT_Smoke @PPE_Smoke @HP_E2E
Scenario: EDC04_CTPRELMGMT-1665_Change of Effective Date-New Property Job for Previous/Past Date ENG Hereditament
	Given User uses test data with ID 'EDC_003' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Boston'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "EffectiveDateChange_E2E_Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       |                  |
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
		| Effective_From          | Effective_To        | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                     |         | No            | Current (live entry) | Published         |                  |
		| effective_from_date     | effective_from_date |         | No            | Previously Current   | Published         |                  |
	And User clicked on 'Created Assessments' button
	Then user asserts 'Created Assessments' row count '0'
	And User switchs to deafult frame
	And User closes browser

@EDC @E2E @Regression
Scenario: EDC05_CTPRELMGMT-549_Validate user is able to change the effective date (backward dating)for a previous current assessment where the assessment action is New
	Given User uses test data with ID 'DEL_001' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForDelEDC_canterbury'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Historic Amendment on New_CTPCASE111_BD" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '30' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofdeletion'
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates the Dekstop Research Questionnaire for 'Deletion'
		| Questions                                                                                                                     |
		| Is the property Occupied?                                                                                                     |
		| Is the property a boat, caravan?                                                                                              |
		| Is the request for deletion as a result of a reconstitution?                                                                  |
		| Is the property an Annexe?                                                                                                    |
		| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
		| Is the request to delete due to the property being demolished?                                                                |
		| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
		| Is the request to delete due to the property being derelict?                                                                  |
		| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
		| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
		| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From			         | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| ProposedEffectiveDateofdeletion    |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
		| Effective_From                  | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| ProposedEffectiveDateofdeletion |                                 |         | No            | Current (live entry) | Published         | Deletion         |
		| effective_from_date             |ProposedEffectiveDateofdeletion |         | No            | Previously Current   | Published         |                  |
	And User switchs to deafult frame
	
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_001'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '30' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC'
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
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	Then User validates and clicks the 'Assessments' tab present in the PVT tablist
	And User selects the '3 - Previously Current' status and 'Insertion (New)' row
	And User click on 'Select Linked Assessment' button link
	And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From               | Effective_To | TaxBand | CompIndicator | AssessmentStatus     	| PublicationStatus | AssessmentAction |
		|ProposedEffectiveDateofEDC	   |              |         | No            | Historic (never live) | Unpublished       | New         	   |
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
	| Effective_From                 | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus          | PublicationStatus | AssessmentAction |
	| ProposedEffectiveDateofEDC	 | ProposedEffectiveDateofdeletion |         | No            | Historic (never live)	 | Published         | New              |
	| effective_from_date            | effective_from_date             |         | No            | Previously Current        | Published         | New              |
	| ProposedEffectiveDateofdeletion|                                 |         | No            | Current (live entry)      | Published         | Deletion         |
	And User switchs to deafult frame
	And User closes browser

@EDC @E2E @Regression
Scenario: EDC06_CTPRELMGMT-549_Validate user is able to change the effective date (forward dating)for a previous current assessment where the assessment action is New
	Given User uses test data with ID 'DEL_001' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForDelEDC_canterbury'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Historic Amendment on New_CTPCASE111" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '30' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofdeletion'
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates the Dekstop Research Questionnaire for 'Deletion'
		| Questions                                                                                                                     |
		| Is the property Occupied?                                                                                                     |
		| Is the property a boat, caravan?                                                                                              |
		| Is the request for deletion as a result of a reconstitution?                                                                  |
		| Is the property an Annexe?                                                                                                    |
		| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
		| Is the request to delete due to the property being demolished?                                                                |
		| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
		| Is the request to delete due to the property being derelict?                                                                  |
		| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
		| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
		| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From			         | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| ProposedEffectiveDateofdeletion    |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
		| Effective_From                  | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| ProposedEffectiveDateofdeletion |                                 |         | No            | Current (live entry) | Published         | Deletion         |
		| effective_from_date             |ProposedEffectiveDateofdeletion |         | No            | Previously Current   | Published         |                  |
	And User switchs to deafult frame
	
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_001'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '15' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC' for EDC job
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
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	Then User validates and clicks the 'Assessments' tab present in the PVT tablist
	And User selects the '3 - Previously Current' status and 'Insertion (New)' row
	And User click on 'Select Linked Assessment' button link
	And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From               | Effective_To | TaxBand | CompIndicator | AssessmentStatus     	| PublicationStatus | AssessmentAction |
		|ProposedEffectiveDateofEDC	   |              |         | No            | Historic (never live) | Unpublished       | New         	   |
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
	| Effective_From                 | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus          | PublicationStatus | AssessmentAction |
	| ProposedEffectiveDateofEDC	 | ProposedEffectiveDateofdeletion |         | No            | Historic (never live)	 | Published         | New              |
	| effective_from_date            | effective_from_date             |         | No            | Previously Current        | Published         | New              |
	| ProposedEffectiveDateofdeletion|                                 |         | No            | Current (live entry)      | Published         | Deletion         |
	And User switchs to deafult frame
	And User closes browser

@EDC @E2E @Regression
Scenario: EDC07_CTPRELMGMT-549_Validate user is able to change the effective date (backward dating)for a previous current assessment where the assessment action is Deletion
Given User uses test data with ID 'TD_006' from 'TestDataPart3' sheet
And User connects to the DB and retrieves the data for 'FindDeletedHereditament_birmingham'
	| fieldName           |
	| uprn                |
	| effective_from_date |
And User is logged in to Dynamics application to work for "Historic Amendment on deletion_CTPCASE111_BD" case
And User collapse if site map navigation expanded on left pane
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'TD_006'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '0' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User switchs to deafult frame

And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_002'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '30' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC'
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
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User validates and clicks the 'Assessments' tab present in the PVT tablist
And User selects the '3 - Previously Current' status and 'Deletion' row
And User click on 'Select Linked Assessment' button link
And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User closes business process stage container
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
#And User clicked on 'History' button
#And User asserts 'History' assessments row count more than '1'
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From               | Effective_To | TaxBand | CompIndicator | AssessmentStatus     	| PublicationStatus | AssessmentAction |
	|ProposedEffectiveDateofEDC	   |              |         | No            | Historic (never live) | Unpublished       | Deletion         |
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
| Effective_From                 | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus          | PublicationStatus | AssessmentAction |
| ProposedEffectiveDateofEDC	 | Proposed Effective Date         |         | No            | Historic (never live)	 | Published         | Deletion         |
| effective_from_date            | effective_from_date             |         | No            | Previously Current        | Published         | Deletion         |
| Proposed Effective Date        |                                 |         | No            | Current (live entry)      | Published         | New              |
And User switchs to deafult frame
And User closes browser

@EDC @E2E @Regression
Scenario: EDC08_CTPRELMGMT-549_Validate user is able to change the effective date (forward dating)for a previous current assessment where the assessment action is Deletion
Given User uses test data with ID 'TD_006' from 'TestDataPart3' sheet
And User connects to the DB and retrieves the data for 'FindDeletedHereditament_birmingham'
	| fieldName           |
	| uprn                |
	| effective_from_date |
And User is logged in to Dynamics application to work for "Historic Amendment on deletion_CTPCASE111_FD" case
And User collapse if site map navigation expanded on left pane
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'TD_006'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '0' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User switchs to deafult frame

And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_002'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '30' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC' for EDC job
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
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User validates and clicks the 'Assessments' tab present in the PVT tablist
And User selects the '3 - Previously Current' status and 'Deletion' row
And User click on 'Select Linked Assessment' button link
And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User closes business process stage container
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
#And User clicked on 'History' button
#And User asserts 'History' assessments row count more than '1'
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From               | Effective_To | TaxBand | CompIndicator | AssessmentStatus     	| PublicationStatus | AssessmentAction |
	|ProposedEffectiveDateofEDC	   |              |         | No            | Historic (never live) | Unpublished       | Deletion         |
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
| Effective_From                 | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus          | PublicationStatus | AssessmentAction |
| ProposedEffectiveDateofEDC	 | Proposed Effective Date         |         | No            | Historic (never live)	 | Published         | Deletion         |
| effective_from_date            | effective_from_date             |         | No            | Previously Current        | Published         | Deletion         |
| Proposed Effective Date        |                                 |         | No            | Current (live entry)      | Published         | New              |
And User switchs to deafult frame
And User closes browser

@EDC @E2E @Regression
 Scenario: EDC09_MR02_CTPRELMGMT-549_Validate user is able to change the effective date (backward dating)for a previous current assessment where the assessment action is Amendment
	Given User uses test data with ID 'MR_002' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Boston'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Historic Amendment on Amendment_CTPCASE111_BD" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '20' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value for 'material redcution' request
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
		| Effective_From                             | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| material redcution_Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
		| Effective_From                             | Effective_To                               | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| material redcution_Proposed Effective Date |                                            | Proposed Tax Band | No            | Current (live entry) | Published         |                  |
		| effective_from_date                        | material redcution_Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
	And User switchs to deafult frame

Given User uses test data with ID 'MR_DEL_001' from 'EDC' sheet	
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value
And User looked for 'Submitted By' field value
And User looked for 'CT Payer' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '35' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofdeletion'
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
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validates the Dekstop Research Questionnaire for 'Deletion'
	| Questions                                                                                                                     |
	| Is the property Occupied?                                                                                                     |
	| Is the property a boat, caravan?                                                                                              |
	| Is the request for deletion as a result of a reconstitution?                                                                  |
	| Is the property an Annexe?                                                                                                    |
	| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
	| Is the request to delete due to the property being demolished?                                                                |
	| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
	| Is the request to delete due to the property being derelict?                                                                  |
	| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
	| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
	| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
And User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User closes business process stage container
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From			         | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| ProposedEffectiveDateofdeletion    |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
	| Effective_From							 | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| ProposedEffectiveDateofdeletion			 |                                 |         | No            | Current (live entry) | Published         |                  |
	| material redcution_Proposed Effective Date |ProposedEffectiveDateofdeletion  |         | No            | Previously Current   | Published         |                  |
And User switchs to deafult frame
	
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_003'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '30' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC'
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
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User validates and clicks the 'Assessments' tab present in the PVT tablist
And User selects the '3 - Previously Current' status and 'Amendment' row
And User click on 'Select Linked Assessment' button link
And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User closes business process stage container
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
#And User clicked on 'History' button
#And User asserts 'History' assessments row count more than '1'
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From               | Effective_To | TaxBand | CompIndicator | AssessmentStatus     	| PublicationStatus | AssessmentAction |
	|ProposedEffectiveDateofEDC	   |              |         | No            | Historic (never live) | Unpublished       | Alteration       |
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
| Effective_From                             | Effective_To                               | TaxBand | CompIndicator | AssessmentStatus      | PublicationStatus  | AssessmentAction |
| ProposedEffectiveDateofEDC                 | ProposedEffectiveDateofdeletion            |         | No            | Historic (never live) | Published          | Alteration       |
| material redcution_Proposed Effective Date | material redcution_Proposed Effective Date |         | No            | Previously Current    | Published          | Alteration       |
| ProposedEffectiveDateofdeletion            |                                            |         | No            | Current (live entry)  | Published          | Deletion         |
And User switchs to deafult frame
And User closes browser

@EDC @E2E @Regression
Scenario: EDC10_MR02_CTPRELMGMT-549_Validate user is able to change the effective date (forward dating)for a previous current assessment where the assessment action is Amendment
	Given User uses test data with ID 'MR_002' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_Boston'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Historic Amendment on Amendment_CTPCASE111_FD" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '20' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value for 'material redcution' request
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
		| Effective_From                             | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| material redcution_Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
		| Effective_From                             | Effective_To                               | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| material redcution_Proposed Effective Date |                                            | Proposed Tax Band | No            | Current (live entry) | Published         |                  |
		| effective_from_date                        | material redcution_Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
	And User switchs to deafult frame

Given User uses test data with ID 'MR_DEL_001' from 'EDC' sheet	
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value
And User looked for 'Submitted By' field value
And User looked for 'CT Payer' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '35' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofdeletion'
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
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validates the Dekstop Research Questionnaire for 'Deletion'
	| Questions                                                                                                                     |
	| Is the property Occupied?                                                                                                     |
	| Is the property a boat, caravan?                                                                                              |
	| Is the request for deletion as a result of a reconstitution?                                                                  |
	| Is the property an Annexe?                                                                                                    |
	| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
	| Is the request to delete due to the property being demolished?                                                                |
	| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
	| Is the request to delete due to the property being derelict?                                                                  |
	| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
	| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
	| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
And User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
#And User closes business process stage container
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From			         | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| ProposedEffectiveDateofdeletion    |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
	| Effective_From							 | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| ProposedEffectiveDateofdeletion			 |                                 |         | No            | Current (live entry) | Published         |                  |
	| material redcution_Proposed Effective Date |ProposedEffectiveDateofdeletion  |         | No            | Previously Current   | Published         |                  |
And User switchs to deafult frame
	
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_003'
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '30' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC' for EDC job
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
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User validates and clicks the 'Assessments' tab present in the PVT tablist
And User selects the '3 - Previously Current' status and 'Amendment' row
And User click on 'Select Linked Assessment' button link
And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User closes business process stage container
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
#And User clicked on 'History' button
#And User asserts 'History' assessments row count more than '1'
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From               | Effective_To | TaxBand | CompIndicator | AssessmentStatus     	| PublicationStatus | AssessmentAction |
	|ProposedEffectiveDateofEDC	   |              |         | No            | Historic (never live) | Unpublished       | Alteration       |
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
| Effective_From                             | Effective_To                               | TaxBand | CompIndicator | AssessmentStatus      | PublicationStatus  | AssessmentAction |
| ProposedEffectiveDateofEDC                 | ProposedEffectiveDateofdeletion            |         | No            | Historic (never live) | Published          | Alteration       |
| material redcution_Proposed Effective Date | material redcution_Proposed Effective Date |         | No            | Previously Current    | Published          | Alteration       |
| ProposedEffectiveDateofdeletion            |                                            |         | No            | Current (live entry)  | Published          | Deletion         |
And User switchs to deafult frame
And User closes browser

@EDC @E2E @Regression
Scenario: EDC11_CTPRELMGMT-1961_SIT-[WAR-1224][WAR-1223][WAR-1222] : Validate user is able to forward dating a Previous Current Assessment where there are 2 list year with current live
Given User uses test data with ID 'EDC_005' from 'EDC' sheet
And User connects to the DB and retrieves the data for 'findhereditament_EDCMR_wales'
	| fieldName           |
	| uprn                |
	| effective_from_date |
And User is logged in to Dynamics application to work for "CTPRELMGMT-1961_EDC_E2E_wales_twolisting" case
And User is logged in to Dynamics application to work for "CTPRELMGMT-1667_EDC_E2E" case
And User collapse if site map navigation expanded on left pane
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value
And User looked for 'Submitted By' field value
And User entered 0 days before date for 'Date Received' field value
And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
#And User entered 25 days before date for 'Proposed Effective Date' field value
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
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
And User clicks on 'Save' on the commandbar
And user waits till 'Saving...' 'progressbar' disappears
And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User clicked on 'Assessment' tab under 'Job Form'
And User waits till ProgressRing disappears
And User switchs to Assessment frame
#And User clicked on 'History' button
#And User asserts 'History' assessments row count more than '1'
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       |                  |
	| effective_from_date     |              |         | No            | Previously Current   | Unpublished       |                  |
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
	| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         |                  |
	| effective_from_date     | effective_from_date     |         | No            | Previously Current   | Published         |                  |
	| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | Deletion         |
And User switchs to deafult frame
And User closes browser

@EDC @E2E @Regression
Scenario: EDC12_CTPRELMGMT-929_SIT-[CTPCASE-412] : Validate changes related to Linked Assessment at desktop research level
	Given User uses test data with ID 'DEL_001' from 'EDC' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForDelEDC_canterbury'
		| fieldName           |
		| band                |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Historic Amendment on New_CTPCASE111" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '30' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofdeletion'
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates the Dekstop Research Questionnaire for 'Deletion'
		| Questions                                                                                                                     |
		| Is the property Occupied?                                                                                                     |
		| Is the property a boat, caravan?                                                                                              |
		| Is the request for deletion as a result of a reconstitution?                                                                  |
		| Is the property an Annexe?                                                                                                    |
		| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
		| Is the request to delete due to the property being demolished?                                                                |
		| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
		| Is the request to delete due to the property being derelict?                                                                  |
		| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
		| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
		| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From			         | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| ProposedEffectiveDateofdeletion    |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
		| Effective_From                  | Effective_To                    | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| ProposedEffectiveDateofdeletion |                                 |         | No            | Current (live entry) | Published         | Deletion         |
		| effective_from_date             |ProposedEffectiveDateofdeletion  |          | No             | Previously Current   | Published        |                  |
	And User switchs to deafult frame
	
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'DELEDC_001'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '15' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value as 'ProposedEffectiveDateofEDC' for EDC job
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
	And User clicked on 'PVT' tab under 'Request Form'
	Then User validates and clicks the 'Assessments' tab present in the PVT tablist
	And user captiures 'linkedAssesment' in featurecontext

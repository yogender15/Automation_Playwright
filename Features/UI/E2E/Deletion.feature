@UI
Feature: Deletion
	Verify Job Request work flow for Deletion

@Deletion @E2E @P1_B @Regression @mini_Regression
Scenario:DEL01_CTPRELMGMT-1677_Manual Processing - Full Demolition
	Given User uses test data with ID 'TD_007' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Full Demotion Manual Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User clicks on 'Is Caravan, Boat or Annex?' dropdown and select 'No' value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	#And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value
	And User looked for 'Relationship Role' field value
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
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container,if still available
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
	And User closes browser


@Deletion @E2E @P1_B @Regression @HP_E2E
Scenario: DEL02_CTPRELMGMT-1552_CTPRELMGMT-1675_CTPRELMGMT-1588_Release and Publish - Borderline CT to NDR
	Given User uses test data with ID 'TD_006' from 'Deletion' sheet
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
	And User closes browser

#@Deletion @E2E @P1_B @Regression @mini_Regression
#Scenario: DEL03_CTPRELMGMT-1671_CTPRELMGMT-1674_Release and Publish - Deletion
#	Given User uses test data with ID 'TD_004' from 'Deletion' sheet
#	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
#		| fieldName           |
#		| town                |
#		| postcode            |
#		| uprn                |
#		| effective_from_date |
#	And User is logged in to Dynamics application to work for "Deletion_E2E_Process" case
#	And User collapse if site map navigation expanded on left pane
#	And User click on 'Requests' under 'Service' section
#	And User click on 'New' button from 'menubar'
#	And User looked for 'Job Type' field value
#	And User looked for 'Submitted By' field value
#	And User looked for 'CT Payer' field value
#	And User entered 0 days before date for 'Date Received' field value
#	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
#	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
#	And User looked for 'Data Source Role' field value
#	And User clicks on 'Channel' dropdown and select 'Email' value
#	And User enter data for 'BA Report Number' field value
#	And User enter data for 'Reason For Validation' field value
#	And User click on 'Find Hereditament' button
#	And User select 'UPRN' value from 'Search By' dropdown
#	And User enters data in "UPRN" field
#	And User clicked on 'Search' button
#	And User slects spcific 'uprn' row from search hereditament results
#	And User clicked on 'Select' button
#	And User waits till Find Hereditament dialog disappears
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
#	#And User 'Assign' 'Job ID' through 'All Jobs'
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on "Job Id" element
#	And User waits till 'Details' stage selected
#	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
#	And User waits till 'Researching' stage selected
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validates the Dekstop Research Questionnaire for 'Deletion'
#		| Questions                                                                                                                     |
#		| Is the property Occupied?                                                                                                     |
#		| Is the property a boat, caravan?                                                                                              |
#		| Is the request for deletion as a result of a reconstitution?                                                                  |
#		| Is the property an Annexe?                                                                                                    |
#		| Is the property being deleted as it is becoming NDR from the same effective date?                                             |
#		| Is the request to delete due to the property being demolished?                                                                |
#		| Have sufficient Photos/evidence been provided to show that it is demolished and when?                                         |
#		| Is the request to delete due to the property being derelict?                                                                  |
#		| Have Photos/structural report been provided to show that it is Derelict and when from?                                        |
#		| Is the request to delete due to the property undergoing a scheme of works that renders it incapable of beneficial occupation? |
#		| Has sufficient evidence been provided such as a schedule of works/ Photos and the date the works started?                     |
#	And User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
#	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
#	And User clicks on 'Save' on the commandbar
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
#	And User waits till 'Maintain Assessment' stage selected
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User waits till ProgressRing disappears
#	And User switchs to Assessment frame
#	And User clicked on 'Created Assessments' button
#	And User asserts below 'Created Assessments' details
#		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | Deletion         |
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
#		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Deletion         |
#		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
#	And User switchs to deafult frame
#	And User closes browser

@Deletion @E2E @P1_B @Regression @SIT_Smoke @UAT_Smoke @PPE_Smoke @TRN_Smoke @FAT_Smoke @HP_E2E
Scenario:DEL04_CTPRELMGMT-1668_Auto Processing - Full Demolition
	Given User uses test data with ID 'TD_001' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Full Demolition Auto Processing" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User clicks on 'Is Caravan, Boat or Annex?' dropdown and select 'No' value
	#And User looked for 'CT Payer' field value
	And User looked for first element 'CT Payer' field value only when data not entered
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Integration' value
	And User enter data for 'BA Report Number' field value
	And User looked for 'Integration Data Source' field value
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
	#And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#And User click on 'Jobs' under 'Service' section
	#And User 'Assign' 'Job Name' through 'All Jobs'
	#And user waits till progress indicator disappears
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "scenarioContext" by "Refresh" grid
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Deletion @E2E @P1_B @Regression
Scenario: DEL05_CTPRELMGMT-1664_Verify Deletion End to end testing on a Hereditament Band which has reduced from Band D to Band C as part of Material Reduction Process 
	Given User uses test data with ID 'MR_002' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Wolverhampton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Create Material Reduction and then Perfom Deletion" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
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
	And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User enter data for 'Level' field value only when data not entered
	#And User looked for 'Parking' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	#And User enter data for 'Conservatory Area' field value only when data not entered
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
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts 'History' assessments row count more than '1'
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | Alteration       |
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
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	#And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Job Type' field value from 'Deletion' for 'TD_003'
	And User looked for 'CT Payer' field value from 'Deletion' for 'TD_003'
	And User scroll to 'Proposed Effective Date' element
	And User entered 25 days before date for 'Proposed Effective Date' field value
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
	And User entered 0 days before date for 'Date Received' field value
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
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Deletion'
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
		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date | Proposed Effective Date |         | No            | Previously Current   | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
		| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Deletion         |
	And User switchs to deafult frame
	And User closes browser

@Deletion @E2E @P1_B @Regression
Scenario: DEL06_CTPRELMGMT-1527_INC3271974 - Full Demolition should autoprocess with Data Source Role of Manual Input
	Given User uses test data with ID 'TD_001' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Full Demolition Auto Processing" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User clicks on 'Is Caravan, Boat or Annex?' dropdown and select 'No' value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Manual Input' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User looked for value 'CR07: demolition of part' in 'Portal Job Type' field by clicking on search icon
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
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

	@Deletion @E2E @P1_B @Regression @mini_Regression
Scenario: DEL07_CTPRELMGMT-1518_[SIT] -[BST-130527][ INC3152130] - Validate error message when wrong billing authority entered by User
	Given User uses test data with ID 'TD_009' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	Given User is logged in to Dynamics application to work for "CTPRELMGMT-1518_BA_ValidationError" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
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
	And User looked for 'Submitted By' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User verifies 'Submitted By : The Submitted By doesn't match with the Hereditament's Billing Authority.' Banner message
	And User closes browser

@Deletion @E2E @P1_B @Regression @mini_Regression
Scenario:DEL08_CTPRELMGMT-401_CTPRELMGMT-1086_[SIT] CTPCASE-415-Validation Error message when deleted hereditament selected for Request
	Given User uses test data with ID 'TD_004' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindDeletedHereditament_Bolton'
		| fieldName           |
		| uprn                |
		| effective_from_date |
		| ba_name             |
	And User is logged in to Dynamics application to work for "Deletion_Hereditament_GuardRails" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
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
	And user waits till 'Saving...' 'progressbar' disappears
	Then user validated 'Hereditament is deleted. This request cannot be saved as the selected Hereditament has been Deleted from the list' contains text
	And User closes browser
@Deletion @E2E @P1_B @Regression @mini_Regression
Scenario:DEL09_CTPRELMGMT-1086_[SIT] CTPCASE-232-INC3483254 - AC1- Deletion job raised before the hereditament was ever live
	Given User uses test data with ID 'TD_004' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindProposedHereditament'
		| fieldName           |
		| uprn                |
		| ba_name             |
	And User is logged in to Dynamics application to work for "Deletion_Hereditament_GuardRails" case
	And User collapse if site map navigation expanded on left pane
    And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects 'Proposed' 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till 'Saving...' 'progressbar' disappears
	Then user validated 'This request cannot be saved as the selected Hereditament is not live and has no Assessments records. Please select a hereditament that is live.' contains text
	And User closes browser


@UI
Feature: CompositePropertyChange


@CompositeDwelling @SIT @P2 @Regression
Scenario: CPC01_CTPRELMGMT-1620_CR06 Composite Dwelling - Desktop Research - See All CR10s linked to CT Composite Change Job Proposed After Current Jobs Effective Date
	Given User uses test data with ID 'CPC_008' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Composite Dwelling property with Material Increase Forward Date" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'CompositeDwelling' for 'CPC_009'
	And User looked for 'Submitted By' field value
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
	#When And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	#Given User clicks on 'Save' on the commandbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Composite Now Wholly Domestic' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates and clicks the 'Related CR10s After Effective Date' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'On Hold' value on the Status Reason Column on the Related CR tab
	And User closes browser

@CompositeDwelling @E2E @HP_E2E @Regression
Scenario: CPC02_CTPRELMGMT-1612_E2E-CL23 (Reduction) - Validate the change code CL23 (Reduction) - CR06 Report through LA Portal
	Given User uses test data with ID 'CPC_010' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_colchester'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "change code CL23 (Reduction)" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Decrease in Domestic Use of Composite' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
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
		| Proposed Effective Date |                         |         | Yes           | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
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
	Then User validates 'Quadient Message' contains 'CL23' data
	And User closes browser
	

@CompositeDwelling @E2E @HP_E2E @Regression
Scenario: CPC03_CTPRELMGMT-1611_E2E-CL22 (Increase) -Validate the change code CL22 (Increase) -CR06 Report through LA Portal
	Given User uses test data with ID 'CPC_010' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_colchester'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "change code CL22 (Increase)" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Increase in Domestic Use of Composite' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	And User looked for 'Proposed Tax Band' and increased 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
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
		| Proposed Effective Date |                         |         | Yes           | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
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
	Then User validates 'Quadient Message' contains 'CL22' data
	And User closes browser


@CompositeDwelling @SIT @P1_A @Regression
Scenario: CPC04_CTPRELMGMT-1546_[SIT]-CT [BST-134437]-E2E- Composite Dwelling - Validate user can use clone to new date functionality for pending set of pads and complete the process end to end
	Given User uses test data with ID 'DE_001' from 'DataEnhancement' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_colchester'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CPC_Pending_" case
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

		#E2E journey of pending record with CPC
	And User uses test data with ID 'CPC_010' from 'CompositeDwelling' sheet
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Composite Now Wholly Domestic' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Pending' record
	And User get PAD attributes of 'Pending' record
	And User clicked on 'Clone to New Date' button
	And User clicked on 'Committed' button
	And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	And User clicked on 'Continue' button
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
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
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
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
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
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
	Then User validates 'Quadient Message' contains 'CL28' data
	And User closes browser

	
@CompositeDwelling @SIT @P1_A @Regression
Scenario: CPC05_E2E-CL21 (Now Composite) -Validate the change code CL21 (Now Composite)Annex - CTPRELMGMT-1700 change linked assesment CTPRELMGMT-1593
	Given User uses test data with ID 'CPC_011' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Annex'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "CL21 (Now Composite)" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
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
	And user waits till app progress indicator disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And User closes business process stage container
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	#And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User enter data for 'Plot Size' field value only when data not entered
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
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	#And User click on the 'Refresh' button from 'menubar' untill 'Pending Release' status display and clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And User click on the 'Refresh' button from 'menubar' and clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And User click on the 'Refresh' button from 'menubar' clicks on 'Yes' button on 'Hereditament of type Annex' dialog until 'pending Release' status is displayed
	#And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	#And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on the 'Refresh' button from 'menubar' clicks on 'Yes' button on 'Hereditament of type Annex' dialog until 'List Updated' status is displayed
	And User clicks on 'OK' button on 'Leave this page?' dialog
	#And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicked on 'Assessment' tab under 'Job Form'
	#And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts below 'History' details
	#	| Effective_From          | Effective_To            | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	#	| Proposed Effective Date |                         |					| No           | Current (live entry) | Published         | Alteration       |
	#	| effective_from_date     | Proposed Effective Date |		            | No            | Previously Current   | Published         | New              |
	#And User switchs to deafult frame

	And User click on 'Requests' under 'Service' section
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
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
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
	And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	#And User closes business process stage container
	#And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
	And User enter data for 'Related Composite Property' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
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
	#And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User enter data for 'Plot Size' field value only when data not entered
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
	And User click on 'Unlock Stage' button from 'menubar'
	And User selects 'Change Linked Assessment' from 'unlockjobstage' this dropdown
	And User clicked on 'Confirm' button
	And user waits till 'Unlock Stage is in progress' icon disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	Then User validates and clicks the 'Assessments' tab present in the PVT tablist
	And User captures "Modifiedband" in 'featureContext' selects the '3 - Previously Current' checkbox and click on 'Select Linked Assessment' button
	And User clicks on 'OK' button on 'Leave this page?' dialog
	#And User clicked on 'Researching' BPF Journey button
	#And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Undertake Banding' BPF Journey button
	And User closes business process stage container
	Then user verifies "Modifiedband" in the banding page
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete the Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Yes' button on 'Hereditament of type Annex' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	#And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User click on the 'Refresh' button from 'menubar' clicks on 'Yes' button on 'Hereditament of type Annex' dialog until 'List Updated' status is displayed


@CompositeDwelling @E2E @Regression
Scenario: CPC06_CTPRELMGMT-909_[CTPCASE-428] : Validate user is able to forward dating a Previous Current Assessment where the Assessment Action is Alteration, should be able to change band or add/remove composite indicator
	Given User uses test data with ID 'CPC_016' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire_CDP'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_CDP_previous assesment" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '20' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value for 'material redcution' request
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
		| Effective_From                            | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		|material redcution_Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
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
#Add informal challenge	
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'CompositeDwelling' for 'CPC_015'
And User looked for 'Submitted By' field value from 'CompositeDwelling' for 'CPC_015'
And User entered 0 days before date for 'Date Received' field value
And User enters '35' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value for 'composite dwelling' request
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
#And User 'Assign' 'Job ID' through 'All Jobs'
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on "Job Id" element
And User waits till 'Details' stage selected
And User clicked on 'Next Stage' for 'Details' journey on the headerbar
And User waits till 'Researching' stage selected
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User scroll to 'Correspondence Address' element	
And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
And User enter data for 'Related Composite Property' field value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
#And User clicked on 'PVT' tab under 'Desktop Research Form'
#And User validates and clicks the 'Assessments' tab present in the PVT tablist
#And User selects the '3 - Previously Current' status and 'Amendment' row
#And User click on 'Select Linked Assessment' button link
#And User clicks on 'OK' button on 'Confirm Link Assessment' dialog
#And User clicked on 'Check Facts' tab under 'Desktop Research Form'
#And User click on 'Save' button from 'menubar'
#And user waits till 'Saving...' 'progressbar' disappears
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
	| Effective_From                            | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| composite dwelling_Proposed Effective Date|              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
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
		| Effective_From                              | Effective_To                               | TaxBand |CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| composite dwelling_Proposed Effective Date  |                                            |         |Yes           | Current (live entry) | Published         |                  |
		| material redcution_Proposed Effective Date  | composite dwelling_Proposed Effective Date |         |No            | Previously Current   | Published         |                  |

And User switchs to deafult frame
And User closes browser
	
	

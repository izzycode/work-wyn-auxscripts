var MASTER_TA_SHEET_ID = "1k4csnUEFxrLcChpswBgSzg5IULqL0pF5ZOqFnz5Ff04";
var INSTRUCTORS_TAB_NAME = "Full-Time/Part-Time Staff";
var TA_INFO_TAB_NAME = "Teaching Assistants Master";
var PEOPLE_KEY = "1l0ved3vvingWITCHU";
var CALENDAR_ID = "israel@wyncode.co";
var DEFAULT_LOCATION = "miami";
var DEFAULT_PROGRAM = "full_time_10_weeks"

function shuffleArray(array) { // Util function to shuffle array
  var currentIndex = array.length;
  var temporaryValue, randomIndex;
  while (0 !== currentIndex) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }
  return array;
}

function numSlotsInWeek( date ){
  var thurs =  4
  var slotsPerDay = 3
  return ( new Date( date ).getDay() - thurs ) * slotsPerDay
}

function getStudentsForCohort( cohortNum ){ // Calls people to get student/email list
  var headers = { headers: "CLIENT-KEY = " + PEOPLE_KEY };
  var studentList = UrlFetchApp.fetch("http://people.wyncode.co/api/v1/users/roster/cohort/" + cohortNum + "/location/" + DEFAULT_LOCATION, headers);
  studentList = studentList.filter( function( student ){
    student.program === DEFAULT_PROGRAM
  }) //TODO need to see what to do with repeats that are no longer in the course (after week 5)
  studentList = studentList.map( function( student ){
    return { name: student.first_name + " " + student.last_name, email: student.email };
  })
  return shuffleArray( studentList ); // Shuffles student list before returning it
}

function getLeadTasWithEmail( tentativeLeadTasList ){ //need to figure out to get the DEFAULT TAS info but leave it open enough so that they can be selected deselected or added removed
  var fullTimeStaff = SpreadsheetApp.openById( MASTER_TA_SHEET_ID ).getSheetByName( INSTRUCTORS_TAB_NAME ).getRange("A3:D20").getValues();
  var resultsList = [];

  fullTimeStaff.forEach( function( staff ){
    var name = staff[1] + " " + staff[2] ;
    tentativeLeadTasList.forEach( function( ta ){
      if( name === ta && staff[0] == "Active" ){
        resultsList.push( { name: name, email: staff[3] } );
      }
    })
  })
  Logger.log( resultsList );
  return( resultsList );
}

function getLevelThreeTas(){
  var levelThreeTas // TODO
}


function weekDatesFromDate( daDate ) { // Returns Monday and Friday date of a given Monday date string
  var response;
  response.monday = new Date( daDate );
  response.friday = new Date( Date.parse( daDate ) + 4*24*60*60*1000 );
  return response;
}

function needExtraTas( numSlots, numStuds ){
  return ( numStuds > numSlots )? true : false
}

function getExtraSlots(){
  // get tas in calendar
  // filter lever 3 ta/slots
  // get amount of needed slots
  // if enough then schedule
  // else add ist of unscheduled student name and email to sheet ¯\_(ツ)_/¯
  // need access to TA Master 1-1 to look at scheduled tas
}

function sendEmails( leadTas, extraTas, students, availSlots ){
}


function onFormSubmit(e) {
  var cohortA = getStudentsForCohort( cohortNum ),
      cohortB = getStudentsForCohort( cohortNum ),
      slots = numSlotsInWeek( date ),
      leadTas = getLeadTasWithEmail(tentativeLeadTasList ),
      extraTas = needExtraTas ? getExtraSlots(),
      allStudents = [...cohortA, ...cohortB];


}

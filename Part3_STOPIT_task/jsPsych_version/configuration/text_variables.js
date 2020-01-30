// instructions page 1
var page1 = [
  '<p>'+
    'You will see a black dot'+ '<img src = ' + fix_stim + ' align="middle" style="width:300px;height:300px;" </img>'+
  '</p>'+
  '<p>'+
    'Followed by a green arrow'+ '<img src = ' + go_stim1 + ' align="middle" style="width:200px;height:200px;" </img>'+'<img src = ' + go_stim2 + ' align="middle" style="width:200px;height:200px;" </img>'+
  '</p>'
];
var page2 = [
  '<p>The green arrow will either be pointing to the LEFT or pointing to the RIGHT</p>'+
  '<p>When you see an arrow pointing to the LEFT, press the left arrow key'+ '<img src = ' + go_stim1 + ' align="middle" style="width:200px;height:200px;" </img></p>' +
  '<p>When you see an arrow pointing to the RIGHT, press the right arrow key' + '<img src = ' + go_stim2 + ' align="middle" style="width:200px;height:200px;" </img></p>' +
  '<p>Except when the the green arrow is quickly replaced by two XXs '+' <img src = ' + stop_stim1 + ' align="middle" style="width:200px;height:200px;" </img></p>' + 
  '<p>When the XX appears, DO NOT PRESS ANYTHING.</p>'
];
var page3 = [
  '<p>Press the arrow key that matches the green arrow on the screen as quickly as possible, but remember to look out for the XXs.</p>' +
  '<p>If you make a mistake that is alright, just keep going. </p>'
];
var page4 = [
  '<p>Now we will do a practice. During the practice you will receive feedback about incorrect and correct responses, but you will not receive this feedback in the real game. </p>'+
  '<p>Please place your fingers on the arrow keys to get ready. </p>'
];

// informed consent text
var informed_consent_text = [
  '<p> Type your informed consent text in the text_variables.js file... </p>'
];

// trial by trial feedback messages
correct_msg = '<p> correct response </p>'
incorrect_msg = '<p> incorrect response </p>'
too_slow_msg = '<p> too slow </p>'
too_fast_msg = '<p> too fast </p>'
correct_stop_msg = '<p> correct stop </p>'
incorrect_stop_msg = '<p> remember: try to stop </p>'

// block feedback
no_signal_header = "<p><b>GO TRIALS: </b></p>"
avg_rt_msg = "<p>Average response time = %d milliseconds</p>"
prop_miss_msg = "<p>Proportion missed go = %.2f (should be 0)</p>"
stop_signal_header = "<p><b>STOP-SIGNAL TRIALS: </b></p>"
prop_corr_msg = "<p>Proportion correct stops = %.2f (should be close to 0.5)</p>" + "<br>"

trial_block_msg = "<p> Great job! Now we will play the game for real.</p>" + 
  "<p>Remember, press the LEFT arrow key when you see the LEFT green arrow, the RIGHT arrow key when you see the RIGHT green arrow, and DO NOT PRESS ANYTHING when you see the XX.</p>";
next_block_msg = "<p>You can take a short break, the next round starts in <span id='timer'>15</span></p>"
final_block_msg = "<p>Press space to continue...</p>" // after the final block they don't need a break

// other
var label_previous_button = 'Previous';
var label_next_button = 'Next';
var label_consent_button = 'I agree';
var full_screen_message = '<p>The game will switch to fullscreen mode when you push the button below. </p>';
var welcome_message = ['<p>Welcome to the game.</p>' + '<p>Press "Next" to begin.</p>'];
var not_supported_message = ['<p>This experiment requires the Chrome or Firefox webbrowser.</p>'];
var subjID_instructions = "Enter your participant ID."
var age_instructions = "Enter your age."
var gender_instructions = "Choose your gender."
var gender_options = ['Female','Male', 'Other', 'Prefer not to say']
var text_at_start_block = "<p>Place your fingers on the arrow keys to get ready</p>"+'<p>Press space to begin.</p>'
var get_ready_message = '<p>Get ready...</p>'
var fixation_text = '<div style="font-size:60px;">TEST</div>'
var end_message = "<p>Thank you for your participation.</p>" +
  "<p>Press space to finalize the experiment.</p>"

var express = require('express');
var router = express.Router();

// object which contains DB access functions
var model = require('../model/installtion_functions');



// overview: this is the landing page for Manage Installations
router.get('/', function(req, res){
	res.render('installation_templates/installation_page');
});




// TODOs will be completed once DB API is ready.

// note: 12/2. changed router method to GET.
// the route will get the create installation view which will have a form, etc.
// with the submit button on this form, a post request will be performed..
router.get('/create', function(req,res) {
	var user = req.session.user;
	// testing route rendering //

	// note: the code below is commented out only for testing the views,
	// please uncomment whenever needed -- phil.
	res.render('installation_templates/add');
	//
	// if (!check(user)) res.redirect('/login');
	// else {
	// 	// TODO: create installation row in DB.
	// }
});


// overview: this is the Edit Installation view.
router.get('/edit', function(req, res){
	res.render('installation_templates/edit');
});


router.post('/remove/:id', function(req,res) {
	var user = req.session.user;
	if (!check(user)) res.redirect('/login');
	else if (!req.params.id) res.sendStatus(400);
	else {
		// TODO: delete installation row from DB.
	}
});

router.post('/update_local_admin/:id', function(req,res) {
	var user = req.session.user;
	if (!check(user)) res.redirect('/login');
	else if (!req.params.id) res.sendStatus(400);
	else {
		// TODO: update local admin column by row ID in DB.
	}
});

/////////
// Utility Functions
/////////
function check(user) {
	return user && user.role === 'global_admin';
}

module.exports = router;
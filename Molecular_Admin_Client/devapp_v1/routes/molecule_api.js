var express = require('express');
var router = express.Router();

module.exports = router;

router.post('/createmolecule', function(req,res) {
	var user = req.session.user;
	  	if (user === undefined || user.role !=='global_admin') {
		    	req.flash('auth', 'Not logged in!');
	    		res.redirect('/login');
		}
		else{}
});
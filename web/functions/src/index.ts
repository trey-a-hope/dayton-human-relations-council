import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
// import * as util from 'util';

admin.initializeApp();
// const db = admin.firestore();

import * as sgMail from '@sendgrid/mail';

const API_KEY = functions.config().sendgrid.key;
const TEMPLATE_ID = functions.config().sendgrid.template;

sgMail.setApiKey(API_KEY);

export const testEmail = functions.https.onRequest(async (req, res) => {

    // var obj_str = util.inspect(req.body);
    // console.log(obj_str);

    const complaint_firstName = req.body.complaint_firstName;
    const complaint_lastName = req.body.complaint_lastName;
    const complaint_organizationName = req.body.complaint_organizationName;
    const complaint_streetAddress = req.body.complaint_streetAddress;
    const complaint_city = req.body.complaint_city;
    const complaint_state = req.body.complaint_state;
    const complaint_zip = req.body.complaint_zip;
    const complaint_phone = req.body.complaint_phone;
    const complaint_email = req.body.complaint_email;

    const msg = {
        to: 'trey.a.hope@gmail.com',
        from: 'trey.a.hope@gmail.com',
        templateId: TEMPLATE_ID,
        dynamic_template_data: {
            subject: 'New Civil Rights Discrimination Complaint Form',
            complaint_firstName: complaint_firstName,
            complaint_lastName: complaint_lastName,
            complaint_organizationName: complaint_organizationName,
            complaint_streetAddress: complaint_streetAddress,
            complaint_city: complaint_city,
            complaint_state: complaint_state,
            complaint_zip: complaint_zip,
            complaint_phone: complaint_phone,
            complaint_email: complaint_email,
        }
    }

    try {
        await sgMail.send(msg);
        res.send(true);
    } catch (error) {
        res.send(error);
    }
});
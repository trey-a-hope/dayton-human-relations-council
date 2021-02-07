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
    const complaint_preferred_contact = req.body.complaint_preferred_contact;

    const respondent_first_name = req.body.respondent_first_name;
    const respondent_last_name = req.body.respondent_last_name;
    const respondent_organization_name = req.body.respondent_organization_name;
    const respondent_street_address = req.body.respondent_street_address;
    const respondent_city = req.body.respondent_city;
    const respondent_state = req.body.respondent_state;
    const respondent_zip = req.body.respondent_zip;
    const respondent_phone = req.body.respondent_phone;
    const respondent_email = req.body.respondent_email;

    const type_of_complaint = req.body.type_of_complaint;
    const discrimination_class = req.body.discrimination_class;
    const last_discriminatory_act = req.body.last_discriminatory_act;
    const why_respondent_discriminated = req.body.why_respondent_discriminated;
    const complaint_filed_with_other_org = req.body.complaint_filed_with_other_org;

    const msg = {
        to: 'trey.a.hope@gmail.com',
        cc: 'thope@imabigcritic.com',
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
            complaint_preferred_contact: complaint_preferred_contact,
            respondent_first_name: respondent_first_name,
            respondent_last_name: respondent_last_name,
            respondent_organization_name: respondent_organization_name,
            respondent_street_address: respondent_street_address,
            respondent_city: respondent_city,
            respondent_state: respondent_state,
            respondent_zip: respondent_zip,
            respondent_phone: respondent_phone,
            respondent_email: respondent_email,
            type_of_complaint: type_of_complaint,
            discrimination_class: discrimination_class,
            last_discriminatory_act: last_discriminatory_act,
            why_respondent_discriminated: why_respondent_discriminated,
            complaint_filed_with_other_org: complaint_filed_with_other_org
        }
    }

    try {
        await sgMail.send(msg);
        res.send(true);
    } catch (error) {
        res.send(error);
    }
});
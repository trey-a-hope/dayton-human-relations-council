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

    const individual_firstName = req.body.individual_firstName;
    const individual_lastName = req.body.individual_lastName;
    const individual_organization_name = req.body.individual_organization_name;
    const individual_street_address = req.body.individual_street_address;
    const individual_city = req.body.individual_city;
    const individual_state = req.body.individual_state;
    const individual_zip = req.body.individual_zip;
    const individual_phone = req.body.individual_phone;
    const individual_email = req.body.individual_email;
    const individual_preferred_contact = req.body.individual_preferred_contact;
    const individual_type_of_complaint = req.body.individual_type_of_complaint;
    const individual_discrimination_class = req.body.individual_discrimination_class;
    const individual_last_discriminatory_act = req.body.individual_last_discriminatory_act;
    const individual_why_respondent_discriminated = req.body.individual_why_respondent_discriminated;
    const individual_complaint_filed_with_other_org = req.body.individual_complaint_filed_with_other_org;
    const organization_first_name = req.body.organization_first_name;
    const organization_last_name = req.body.organization_last_name;
    const organization_organization_name = req.body.organization_organization_name;
    const organization_street_address = req.body.organization_street_address;
    const organization_city = req.body.organization_city;
    const organization_state = req.body.organization_state;
    const organization_zip = req.body.organization_zip;
    const organization_phone = req.body.organization_phone;
    const organization_email = req.body.organization_email;
    const organization_preferred_contact = req.body.organization_preferred_contact;
    const organization_type_of_complaint = req.body.organization_type_of_complaint;
    const organization_discrimination_class = req.body.organization_discrimination_class;
    const organization_last_discriminatory_act = req.body.organization_last_discriminatory_act;
    const organization_why_respondent_discriminated = req.body.organization_why_respondent_discriminated;
    const organization_complaint_filed_with_other_org = req.body.organization_complaint_filed_with_other_org;

    const msg = {
        to: ['civilrights@daytonohio.gov', 'jacob.davis@daytonohio.gov'],
        //cc: 'trey.a.hope@gmail.com',
        from: 'trey.a.hope@gmail.com',
        templateId: TEMPLATE_ID,
        dynamic_template_data: {
            subject: 'New Civil Rights Discrimination Complaint Form',
            individual_firstName: individual_firstName,
            individual_lastName: individual_lastName,
            individual_organization_name: individual_organization_name,
            individual_street_address: individual_street_address,
            individual_city: individual_city,
            individual_state: individual_state,
            individual_zip: individual_zip,
            individual_phone: individual_phone,
            individual_email: individual_email,
            individual_preferred_contact: individual_preferred_contact,
            individual_type_of_complaint: individual_type_of_complaint,
            individual_discrimination_class: individual_discrimination_class,
            individual_last_discriminatory_act: individual_last_discriminatory_act,
            individual_why_respondent_discriminated: individual_why_respondent_discriminated,
            individual_complaint_filed_with_other_org: individual_complaint_filed_with_other_org,
            organization_first_name: organization_first_name,
            organization_last_name: organization_last_name,
            organization_organization_name: organization_organization_name,
            organization_street_address: organization_street_address,
            organization_city: organization_city,
            organization_state: organization_state,
            organization_zip: organization_zip,
            organization_phone: organization_phone,
            organization_email: organization_email,
            organization_preferred_contact: organization_preferred_contact,
            organization_type_of_complaint: organization_type_of_complaint,
            organization_discrimination_class: organization_discrimination_class,
            organization_last_discriminatory_act: organization_last_discriminatory_act,
            organization_why_respondent_discriminated: organization_why_respondent_discriminated,
            organization_complaint_filed_with_other_org: organization_complaint_filed_with_other_org
        }
    }

    try {
        await sgMail.send(msg);
        res.send(true);
    } catch (error) {
        res.send(error);
    }
});
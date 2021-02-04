import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
// const db = admin.firestore();

import * as sgMail from '@sendgrid/mail';

const API_KEY = functions.config().sendgrid.key;
const TEMPLATE_ID = functions.config().sendgrid.template;

sgMail.setApiKey(API_KEY);

export const testEmail = functions.https.onRequest(async (req, res) => {
    //const uid = req.body.uid;

    const msg = {
        to: 'trey.a.hope@gmail.com',
        from: 'trey.a.hope@gmail.com',
        templateId: TEMPLATE_ID,
        dynamic_template_data: {
            subject: 'Welcome to my awesome app!',
            username: 'Joey Wheeler'
        }
    }

    try {
        await sgMail.send(msg);
        res.send(true);
    } catch (error) {
        res.send(error);
    }
});
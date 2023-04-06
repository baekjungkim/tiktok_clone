import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
export const onVideoCreated = functions
  .region('asia-northeast3')
  .firestore.document('videos/{videoId}')
  .onCreate(async (snapshot, context) => {
    // await snapshot.ref.update({ thumbnailUrl: '' });
    var spawn = require('child-process-promise').spawn;
    const video = snapshot.data();
    await spawn('ffmpeg', [
      '-i', // input file url
      video.fileUrl,
      '-ss', // move file seconds
      '00:00:01.000',
      '-vframes', // snapshot thumbnail
      '1', // 1 take
      '-vf', // video filter
      'scale=150:-1', // width 150 : height ffmpeg auto
      `/tmp/${snapshot.id}.jpg`, // temp save
    ]);

    const storage = admin.storage();
    storage.bucket().upload(`/tmp/${snapshot.id}.jpg`, {
      destination: `thumbnails/${snapshot.id}.jpg`,
    });
  });

![1_khYHK49AZ40p-WVc_UCHJQ](https://github.com/user-attachments/assets/8de44df6-00f4-4cfe-b94c-c9df40f0ec7c)
🧐 Observation
Initially, we notice that the video file size is unusually large, which is suspicious.
Normally, videos do not store separate metadata for every frame, but in this case, each frame appears to have its own metadata.

💡 Clues from the Description
The challenge description clearly hints at a frame-by-frame analysis.
The phrase “DOOM by DOOM” suggests examining the video one frame at a time.
Additional hints further support this approach.

Convert Video into Frames
ffmpeg -i final_lossless.mkv frame_%05d.png

![1_uolGaz2DVCbPuOTQIjWIXQ](https://github.com/user-attachments/assets/0564bc03-747e-4ed4-a4bc-d4450d71d823)


![1_9RMz-Ucdae0XvvkHzH6nXg](https://github.com/user-attachments/assets/38b49186-0769-4f80-8a0d-edda33c77a6f)

See LSB Of Intaial Frames
zsteg frame_00001.png

![1_bVhh3IPJRcsMnFU8gcOnnA](https://github.com/user-attachments/assets/74555dfe-7ed9-43a0-89b7-9391f34e26d4)

The Flag is Hidden in the LSB of Frames

JCE{Frames_Of_Fire_Ryt!}


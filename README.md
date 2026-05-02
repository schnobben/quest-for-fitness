# Quest for Fitness

A mobile-first offline fitness logbook built with React, Vite, TypeScript, and localStorage.

## Run Locally

```powershell
npm.cmd install
npm.cmd run dev:mobile
```

Open the Network URL shown by Vite on your Android phone while it is on the same Wi-Fi.

## Install On Android With GitHub Pages

GitHub Pages gives the app the HTTPS URL Android Chrome needs for a proper installable PWA.

1. Create a new GitHub repository named `quest-for-fitness`.
2. Push this project to that repository on the `main` branch.
3. In GitHub, open the repository settings.
4. Go to `Pages`.
5. Under `Build and deployment`, set `Source` to `GitHub Actions`.
6. Go to the repository `Actions` tab and wait for `Deploy PWA to GitHub Pages` to finish.
7. Open the Pages URL on your Android phone. It will look like `https://YOUR-GITHUB-USERNAME.github.io/quest-for-fitness/`.
8. In Chrome, open the menu and choose `Install app` or `Add to Home screen`.

After the first successful load, the app shell is cached for offline use. Your workout data stays on the phone in that browser's localStorage.

## Export Data

Open `History` and tap `Export JSON`. On Android, Chrome will use the share sheet when available; otherwise it downloads a timestamped `.json` file. The export includes workouts, runs, body weight, goals, working weights, and the program config.

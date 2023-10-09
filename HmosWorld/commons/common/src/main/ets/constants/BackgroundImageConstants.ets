interface ISplash {
  day: Resource[];
  dusk: Resource[];
  night: Resource[];
}

export const splashImages: ISplash = {
  day: [
    $r('app.media.ic_splash1'),
    $r('app.media.ic_splash2'),
    $r('app.media.ic_splash3')
  ],
  dusk: [
    $r('app.media.ic_splash4'),
    $r('app.media.ic_splash5'),
    $r('app.media.ic_splash6')
  ],
  night: [
    $r('app.media.ic_splash7'),
    $r('app.media.ic_splash8'),
    $r('app.media.ic_splash9')
  ]
}
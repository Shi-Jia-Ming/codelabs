import nativerender from "libnativerender.so";
import { ContextType } from "./common/Constants"

export default {
  onCreate() {
    console.info('[LIFECYCLE-App] onCreate')
  },
  onShow() {
    console.info('[LIFECYCLE-App] onShow')
  },
  onHide() {
    console.info('[LIFECYCLE-App] onHide')
  },
  onDestroy() {
    console.info('[LIFECYCLE-App] onDestroy')
  },
}
import { Header } from '../view/Header';
import { LiveList } from '../view/LiveList';
import { LiveConstants } from '../common/constants/LiveConstants';

@Entry
@Component
struct Live {
  build() {
    Column() {
      Header()
      LiveList()
    }
    .width(LiveConstants.FULL_WIDTH_PERCENT)
    .height(LiveConstants.FULL_HEIGHT_PERCENT)
  }
}
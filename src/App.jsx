import MainLayout from "~/layouts/MainLayout";
import { Route, Routes } from "react-router-dom";
import routes from "~/utils/constants/routes";
import DailyGasNetworkEventLog from "~/pages/reports/DailyGasNetworkEventLog";
import DailyBuyersNotification from "./pages/reports/DailyBuyersNotification";
import DailyGasOperations from "./pages/reports/DailyGasOperations";
import DailyGasOfftakeRequest from "~/pages/reports/DailyGasOfftakeRequest";
import MonthlyDvcDeclaration from "~/pages/reports/MonthlyDvcDeclaration";
import TagPnv from "~/pages/reports/TagPnv";
import GasSchedulersLog from "~/pages/reports/GasSchedulersLog";
import BuyersDailyNomination from "~/pages/reports/BuyersDailyNomination";


function App() {
  return (
    <Routes>
      <Route element={<MainLayout />}>
        <Route path="/" element={<DailyGasNetworkEventLog />} />
        <Route path={routes.UI.DAILY_BUYERS_NOTIFICATION()} element={<DailyBuyersNotification />} />
        <Route path={routes.UI.DAILY_GAS_OPERATIONS()} element={<DailyGasOperations />} />
        <Route path={routes.UI.DAILY_GAS_OFFTAKE_REQUEST()} element={<DailyGasOfftakeRequest />} />
        <Route path={routes.UI.MONTHLY_DVC_DECLARATION()} element={<MonthlyDvcDeclaration />} />
        <Route path={routes.UI.MONTHLY_PNV()} element={<TagPnv />} />
        <Route path={routes.UI.GAS_SCHEDULERS_LOG()} element={<GasSchedulersLog />} />
        <Route path={routes.UI.BUYERS_DAILY_NOMINATION()} element={<BuyersDailyNomination />} />
      </Route>
    </Routes>
  );
}

export default App;

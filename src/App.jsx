import MainLayout from "~/layouts/MainLayout";
import { Route, Routes } from "react-router-dom";
import routes from "~/utils/constants/routes";
import DailyGasNetworkEventLog from "~/pages/reports/DailyGasNetworkEventLog";
import DailyBuyersNotification from "./pages/reports/DailyBuyersNotification";
import DailyGasOperations from "./pages/reports/DailyGasOperations";
import DailyGasOfftakeRequest from "./pages/reports/DailyGasOfftakeRequest";
import MonthlyDvcDeclaration from "./pages/reports/MonthlyDvcDeclaration";
import MonthlyPnv from "./pages/reports/MonthlyPnv";

function App() {
  return (
    <Routes>
      <Route element={<MainLayout />}>
        <Route path="/" element={<DailyGasNetworkEventLog />} />
        <Route path={routes.UI.DAILY_BUYERS_NOTIFICATION()} element={<DailyBuyersNotification />} />
        <Route path={routes.UI.DAILY_GAS_OPERATIONS()} element={<DailyGasOperations />} />
        <Route path={routes.UI.DAILY_GAS_OFFTAKE_REQUEST()} element={<DailyGasOfftakeRequest />} />
        <Route path={routes.UI.MONTHLY_DVC_DECLARATION()} element={<MonthlyDvcDeclaration />} />
        <Route path={routes.UI.MONTHLY_PNV()} element={<MonthlyPnv />} />
      </Route>
    </Routes>
  );
}

export default App;

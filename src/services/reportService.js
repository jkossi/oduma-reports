import axios from "~/utils/apiConfig";

async function getEvents(path) {
  const response = await axios.get(path);

  return response.data;
}

export { getEvents };

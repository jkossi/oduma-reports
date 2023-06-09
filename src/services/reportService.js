import axios from "~/utils/apiConfig";

async function getClients(path) {
  const response = await axios.get(path);

  return response.data;
}

async function getEvents(path) {
  const response = await axios.get(path);

  return response.data;
}

async function getNominations(path) {
  const response = await axios.get(path);

  return response.data;
}

export { getClients, getEvents, getNominations };

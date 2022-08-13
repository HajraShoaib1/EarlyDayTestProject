import axios from 'axios';
import React, { useState, useContext } from 'react';
import { Container } from 'react-bootstrap';
import { useParams } from 'react-router-dom';
import { AuthContext } from '../providers/AuthProvider';
import { RequireAuth } from '../components/RequireAuth';

const Job = (props) => {
  const params = useParams();
  console.log(params.slug)
  const [job, setJob] = useState(null)
  const [jobApplications, setJobApplications] = useState([])
  const {authenticated} = useContext(AuthContext)

  const applyToJob = (e) => {
    e.preventDefault();
    console.log(authenticated.user)
      if(authenticated) {const data = {
        job_id: job?.id,
        user_id: authenticated.id,
      }
      axios.post('/job_applications/', data)
      .then(res => {
        setJobApplications([...jobApplications, res.data])
        console.log(res.data)
      })
      .catch(err => {
        setJob([])
        console.log(err)
      }
      )}
  }

  React.useEffect(() => {

    axios.get('/jobs/' + params.slug)
    .then(res => {
      setJob(res.data)
      console.log(res.data)
    })
    .catch(err => {
      setJob([])
      console.log(err)
    }
    )
  }, [])

  return(
    <Container>
      <h1>{job?.title}</h1>
      <p>{job?.description}</p>
      <button onClick={applyToJob}>
        Apply to Job
      </button>
    </Container>
  )
};

export default Job;

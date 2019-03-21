
import * as React from 'react'
import axios from 'axios'
import * as styles from './index.module.scss'
import RatingQuestion from './RatingQuestion'
import AddRatingQuestion from './AddRatingQuestion';
// import { ratingQuestion } from './RatingQuestion.module.scss';


interface Question {
  id: string,
  title: string,
  rating_question_url: string
}

interface RatingQuestionsProps {
  questions: Question[]
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {
  state = {
    questions: this.props.questions
  }
  handleDelete: (e) => {    
  }

  addQuestion = (question) => {
    let questions = this.state.questions
    questions.push(question)
    this.setState({questions})
  }

  render() {
    console.log(this.state.questions)
    return(
      <div className={styles.list} data-automation-id='questions-list'>
        {this.state.questions.map((question) => 
              <a href={question.rating_question_url}>
                <RatingQuestion key={question.id} {...question} /></a>,
            //   <a className="btn btn-danger btn-xs"
            //     onClick={this.handleDelete} >
            //    Delete
            //  </a>
          )}
      <AddRatingQuestion rating_question_url="/rating_questions.json" addQuestion={this.addQuestion}/>
      </div>

    )
  }
}

export default RatingQuestions

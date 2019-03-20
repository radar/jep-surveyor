import * as React from 'react'
import * as styles from './ShowRatingQuestion.module.scss'
import RatingQuestion from './RatingQuestion'

interface Question {
    title: string,
    id: string
}

interface ShowRatingQuestionProps {
    question: Question
}

class ShowRatingQuestion extends React.Component<ShowRatingQuestionProps> {
    render() {
        return(
            <div className={styles.ratingQuestion} data-automation-id='question'>
                {this.props.question.title}
            </div>
        )
    }
}

export default ShowRatingQuestion
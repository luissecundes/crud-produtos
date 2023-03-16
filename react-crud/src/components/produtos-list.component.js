import React, { Component } from "react";
import ProdutoDataService from "../service/produto.service";
import { Link } from "react-router-dom";
import Moment from "react-moment";

export default class ProdutosList extends Component {
  constructor(props) {
    super(props);
    this.onChangeSearchName = this.onChangeSearchName.bind(this);
    this.retrieveProdutos = this.retrieveProdutos.bind(this);
    this.refreshList = this.refreshList.bind(this);
    this.setActiveProduto = this.setActiveProduto.bind(this);
    this.searchName = this.searchName.bind(this);

    this.state = {
      produtos: [],
      currentProduto: null,
      currentIndex: -1,
      searchName: "",
    };
  }

  componentDidMount() {
    this.retrieveProdutos();
  }

  onChangeSearchName(e) {
    const searchName = e.target.value;

    this.setState({
      searchName: searchName,
    });
  }

  retrieveProdutos() {
    ProdutoDataService.getAll()
      .then((response) => {
        this.setState({
          produtos: response.data,
        });
        console.log(response.data);
      })
      .catch((e) => {
        console.log(e);
      });
  }

  refreshList() {
    this.retrieveProdutos();
    this.setState({
      currentProduto: null,
      currentIndex: -1,
    });
  }

  setActiveProduto(produto, index) {
    this.setState({
      currentProduto: produto,
      currentIndex: index,
    });
  }

  searchName() {
    ProdutoDataService.findByName(this.state.searchName)
      .then((response) => {
        let array = [];
        if (Array.isArray(response.data)) {
          response.data.forEach((item) => array.push(item));
        } else {
          array.push(response.data);
        }
        this.setState({
          produtos: array,
        });
        console.log(response.data);
      })
      .catch((e) => {
        console.log(e);
      });
  }

  render() {
    const { searchName, produtos, currentProduto, currentIndex } = this.state;

    return (
      <div className="list row">
        <div className="col-md-8">
          <div className="input-group mb-3">
            <input
              type="text"
              className="form-control"
              placeholder="Buscar por nome"
              value={searchName}
              onChange={this.onChangeSearchName}
            />

            <div className="input-group-append">
              <button
                className="btn btn-outline-secondary"
                type="button"
                onClick={this.searchName}
              >
                Buscar
              </button>
            </div>
          </div>
        </div>
        <div className="col-md-6 ">
          <h4>Lista de Produtos</h4>

          <ul className="list-group">
            {Array.isArray(produtos) &&
              produtos
                .filter((produto) =>
                  produto.name.toLowerCase().includes(searchName.toLowerCase())
                )
                .map((produto, index) => (
                  <li
                    className={
                      "list-group-item " +
                      (index === currentIndex ? "active" : "")
                    }
                    onClick={() => this.setActiveProduto(produto, index)}
                    key={index}
                  >
                    {produto.name}
                  </li>
                ))}
          </ul>
        </div>
        <div className="col-md-6">
          {currentProduto ? (
            <div>
              <h4>Produto</h4>
              <div>
                <label>
                  <strong>Nome do Produto:</strong>
                </label>{" "}
                {currentProduto.name}
              </div>
              <div>
                <label>
                  <strong>Descrição:</strong>
                </label>{" "}
                {currentProduto.description}
              </div>
              <div>
                <label>
                  <strong>Data de Expiração:</strong>
                </label>{" "}
                <Moment format="DD/MM/YYYY">{currentProduto.expiration}</Moment>
              </div>
              <div>
                <label>
                  <strong>Data de Aquisição:</strong>
                </label>{" "}
                <Moment format="DD/MM/YYYY">
                  {currentProduto.acquisition}
                </Moment>
              </div>
              <div>
                <label>
                  <strong>Data de Consumo:</strong>
                </label>{" "}
                <Moment format="DD/MM/YYYY">
                  {currentProduto.consumption}
                </Moment>
              </div>
              <div>
                <label>
                  <strong></strong>
                </label>{" "}
                {currentProduto.published ? "Published" : ""}
              </div>

              <Link
                to={"/product/" + currentProduto.id}
                className="btn btn-primary"
              >
                Editar
              </Link>
            </div>
          ) : (
            <div>
              <br />
              <p>Por favor, selecione um produto</p>
            </div>
          )}
        </div>
      </div>
    );
  }
}

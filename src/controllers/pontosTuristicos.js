const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

const create = async (req, res) => {
    const data = req.body;

    console.log(data);

    const pontosTuristicos = await prisma.pontosTuristicos.create({
        data
    });

    res.status(201).json(pontosTuristicos).end();
}

const read = async (req, res) => {
    const pontosTuristicos = await prisma.pontosTuristicos.findMany();

    res.status(200).json(pontosTuristicos).end();
}

const remove = async (req, res) => {
    const id = Number(req.params.id);
    const pontosTuristicos = await prisma.pontosTuristicos.delete({
        where: {
            id: Number(req.params.id)
        }
    });

    res.status(200).json(pontosTuristicos).end();
}

const update = async (req, res) => {
    const id = Number(req.params.id);
    const data = req.body;

    const pontosTuristicos = await prisma.pontosTuristicos.update({
        where: {
            id
        },
        data
    });

    res.status(200).json(pontosTuristicos).end();
}

module.exports = {
    create,
    read,
    remove,
    update,
}